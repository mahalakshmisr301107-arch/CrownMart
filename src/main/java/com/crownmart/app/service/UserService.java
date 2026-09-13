package com.crownmart.app.service;

import java.time.LocalDateTime;
import java.util.List;

import com.crownmart.app.dao.UserDao;
import com.crownmart.app.dto.RegisterRequest;
import com.crownmart.app.exception.AuthenticationException;
import com.crownmart.app.exception.ValidationException;
import com.crownmart.app.model.User;
import com.crownmart.app.util.PasswordUtil;
import com.crownmart.app.util.ValidationUtil;

public class UserService {

    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public User register(RegisterRequest request) throws ValidationException {
        ValidationUtil.requireNonBlank(request.getName(), "Name");
        ValidationUtil.requireValidEmail(request.getEmail());
        ValidationUtil.requireMinLength(request.getPassword(), 8, "Password");

        User.Role role;
        try {
            role = User.Role.valueOf(request.getRole());
        } catch (IllegalArgumentException | NullPointerException e) {
            throw new ValidationException("Role must be BUYER or SELLER.");
        }

        if (userDao.existsByEmail(request.getEmail().trim().toLowerCase())) {
            throw new ValidationException("An account with that email already exists.");
        }

        User user = new User();
        user.setName(request.getName().trim());
        user.setEmail(request.getEmail().trim().toLowerCase());
        user.setPasswordHash(PasswordUtil.hash(request.getPassword()));
        user.setRole(role);
        user.setCreatedAt(LocalDateTime.now());

        return userDao.insert(user);
    }

    public User authenticate(String email, String password) throws AuthenticationException {
        if (email == null || password == null) {
            throw new AuthenticationException("Email and password are required.");
        }
        User user = userDao.findByEmail(email.trim().toLowerCase())
                .orElseThrow(() -> new AuthenticationException("Invalid email or password."));

        if (!PasswordUtil.verify(password, user.getPasswordHash())) {
            throw new AuthenticationException("Invalid email or password.");
        }
        return user;
    }

    public List<User> findAll() {
        return userDao.findAll();
    }
}
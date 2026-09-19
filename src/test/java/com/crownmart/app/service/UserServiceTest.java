package com.crownmart.app.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.crownmart.app.dao.UserDao;
import com.crownmart.app.dto.RegisterRequest;
import com.crownmart.app.exception.AuthenticationException;
import com.crownmart.app.exception.ValidationException;
import com.crownmart.app.model.User;
import com.crownmart.app.util.PasswordUtil;

class UserServiceTest {

    private UserDao userDao;
    private UserService service;

    @BeforeEach
    void setUp() {
        userDao = mock(UserDao.class);
        service = new UserService(userDao);
    }

    private RegisterRequest request(String name, String email, String password, String role) {
        RegisterRequest r = mock(RegisterRequest.class);
        when(r.getName()).thenReturn(name);
        when(r.getEmail()).thenReturn(email);
        when(r.getPassword()).thenReturn(password);
        when(r.getRole()).thenReturn(role);
        return r;
    }

    @Test
    void registerRejectsUnknownRole() {
        RegisterRequest r = request("Asha", "asha@crownmart.com", "password123", "HACKER");
        assertThrows(ValidationException.class, () -> service.register(r));
        verify(userDao, never()).insert(any(User.class));
    }

    @Test
    void registerRejectsDuplicateEmail() {
        when(userDao.existsByEmail("asha@crownmart.com")).thenReturn(true);
        RegisterRequest r = request("Asha", "asha@crownmart.com", "password123", "BUYER");
        assertThrows(ValidationException.class, () -> service.register(r));
        verify(userDao, never()).insert(any(User.class));
    }

    @Test
    void registerSavesUserWithLowercasedEmailAndHashedPassword() throws Exception {
        when(userDao.existsByEmail("new@crownmart.com")).thenReturn(false);
        when(userDao.insert(any(User.class))).thenAnswer(inv -> inv.getArgument(0));
        RegisterRequest r = request("New User", "New@CrownMart.com", "password123", "SELLER");

        User saved = service.register(r);

        assertEquals("new@crownmart.com", saved.getEmail());
        assertEquals(User.Role.SELLER, saved.getRole());
        assertEquals(true, PasswordUtil.verify("password123", saved.getPasswordHash()));
    }

    @Test
    void authenticateFailsForUnknownEmail() {
        when(userDao.findByEmail("nobody@crownmart.com")).thenReturn(Optional.empty());
        assertThrows(AuthenticationException.class, () -> service.authenticate("nobody@crownmart.com", "whatever1"));
    }

    @Test
    void authenticateFailsForWrongPasswordAndSucceedsForRightOne() throws Exception {
        User user = mock(User.class);
        when(user.getPasswordHash()).thenReturn(PasswordUtil.hash("secret123"));
        when(userDao.findByEmail("a@crownmart.com")).thenReturn(Optional.of(user));

        assertThrows(AuthenticationException.class, () -> service.authenticate("a@crownmart.com", "wrong-pass"));
        assertEquals(user, service.authenticate("a@crownmart.com", "secret123"));
    }
}
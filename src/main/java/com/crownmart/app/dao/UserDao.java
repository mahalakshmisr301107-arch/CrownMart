package com.crownmart.app.dao;

import java.util.Optional;

import com.crownmart.app.model.User;

public interface UserDao {

    User insert(User user);

    Optional<User> findByEmail(String email);

    Optional<User> findById(long id);

    boolean existsByEmail(String email);
}

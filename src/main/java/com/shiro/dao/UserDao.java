package com.shiro.dao;


import com.shiro.entity.User;

import java.util.List;

public interface UserDao {

    int createUser(User user);
    int updateUser(User user);
    int deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

}

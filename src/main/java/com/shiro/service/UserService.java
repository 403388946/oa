package com.shiro.service;


import com.shiro.model.User;

import java.util.List;
import java.util.Set;

public interface UserService {

    /**
     * 创建用户
     * @param user
     */
    User save(User user);

    User updateUser(User user);

    int deleteUser(Long userId);

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    int savePassword(Long userId, String newPassword);


    User findOne(Long userId);



    List<User> findAll();

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    User findByUsername(String username);

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    Set<String> findRoles(String username);

    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    Set<String> findPermissions(String username);

}

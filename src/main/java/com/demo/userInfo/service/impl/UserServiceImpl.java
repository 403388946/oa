/**
 * Copyright (c) 2015 by ZALLDS
 * All rights reserved.
 */

package com.demo.userInfo.service.impl;

import com.demo.userInfo.mapper.UserMapper;
import com.demo.userInfo.model.User;
import com.demo.userInfo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 类职责简要描述
 * @author: mingyi
 * @Date: 16-6-21 
 * @Time: 下午12:31
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    public User getUserInfoById(String userId) {
        return userMapper.getUserInfoById(Long.valueOf(userId));
    }


}

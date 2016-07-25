/**
 * Copyright (c) 2015 by ZALLDS
 * All rights reserved.
 */

package com.oa.userInfo.service.impl;

import com.oa.userInfo.mapper.UserMapper;
import com.oa.userInfo.model.User;
import com.oa.userInfo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

/**
 * Copyright (c) 2015 by ZALLDS
 * All rights reserved.
 */

package com.demo.userInfo.service;

import com.demo.userInfo.model.User;
import org.springframework.stereotype.Service;

/**
 * 类职责简要描述
 * @author: mingyi
 * @Date: 16-6-21 
 * @Time: 下午12:31
 */
@Service
public interface UserService {

    User getUserInfoById(String userId);
}

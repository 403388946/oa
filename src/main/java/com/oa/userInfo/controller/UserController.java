/**
 * Copyright (c) 2015 by ZALLDS
 * All rights reserved.
 */

package com.oa.userInfo.controller;

import com.oa.userInfo.model.User;
import com.oa.userInfo.service.UserXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 类职责简要描述
 * @author: mingyi
 * @Date: 16-6-21 
 * @Time: 下午12:26
 */
@RequestMapping(value = "/user")
@Controller
public class UserController {

    @Autowired
    private UserXService userService;

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public String get(@RequestParam(value = "id", required = false)Long id) {
        System.out.println("id = [" + id + "]");
        User user = userService.getUserInfoById("1034");
        System.out.println("UserName = [" + user.getUserName() + "]");
        return "/user/info";
    }
}

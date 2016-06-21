/**
 * Copyright (c) 2015 by ZALLDS
 * All rights reserved.
 */

package com.demo.userInfo.model;

/**
 * 类职责简要描述
 * @author: mingyi
 * @Date: 16-6-21 
 * @Time: 下午12:30
 */
public class User {

    private Long id;
    private String userName;
    private String loginName;
    private String newUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getNewUserId() {
        return newUserId;
    }

    public void setNewUserId(String newUserId) {
        this.newUserId = newUserId;
    }
}

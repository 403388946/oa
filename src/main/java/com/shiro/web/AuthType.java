package com.shiro.web;

/**
 * 权限KEY
 * @author YiMing on 2016/8/15.
 */
public class AuthType {

    public static final String MANAGE = "manage";
    public static final String CREATE = "create";
    public static final String SAVE = "save";
    public static final String UPDATE = "update";
    public static final String DELETE = "delete";
    public static final String LIST = "view";

    public static String setPermission(String serviceName, String authType) {
        return serviceName + ":" + authType;
    }
}

package com.oa.utils;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author YiMing on 2016/8/6.
 */
public class LoginUtils {

    private static Logger logger = LoggerFactory.getLogger(LoginUtils.class);


    public static String getCurrentUserLoginName() {
        return (String)SecurityUtils.getSubject().getPrincipal();
    }

}

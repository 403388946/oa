package com.shiro;

import com.shiro.service.UserService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by 40338 on 2016/7/28.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring/applicationContext.xml" })
public class Test {


    @Autowired
    private UserService userService;



    @org.junit.Test
    public void changePassword() {
        userService.changePassword(1l, "123456");
    }

}

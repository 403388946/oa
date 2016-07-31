package com.shiro.web.controller;

import com.shiro.model.Resource;
import com.shiro.model.User;
import com.shiro.service.ResourceService;
import com.shiro.service.UserService;
import com.shiro.web.bind.annotation.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/index","/"})
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);
        //return this.userStylePath(user) + "/index";
        return "index";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}

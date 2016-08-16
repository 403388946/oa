package com.shiro.web.controller;

import com.shiro.model.Resource;
import com.shiro.model.User;
import com.shiro.service.ResourceService;
import com.shiro.service.UserService;
import com.shiro.web.bind.annotation.CurrentUser;
import com.sys.SysConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/manage"})
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);
        //return this.userStylePath(user) + "/index";
        return "manage";
    }

    @RequestMapping(value = {"/menus"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Resource> menus(@CurrentUser User loginUser) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenusByRootId(permissions, SysConstants.MENU_ROOT_ID);
        return menus;
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    @RequestMapping(value = {"/index"})
    public String index() {
        return "index";
    }
}

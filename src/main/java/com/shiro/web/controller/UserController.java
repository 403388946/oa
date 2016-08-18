package com.shiro.web.controller;

import com.shiro.model.User;
import com.shiro.service.OrganizationService;
import com.shiro.service.RoleService;
import com.shiro.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private RoleService roleService;

    @RequiresPermissions("user:view")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("userList", userService.findAll());
        return "user/list";
    }

    @RequiresPermissions("user:create")
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        model.addAttribute("user", new User());
        return "user/edit";
    }

    @RequiresPermissions("user:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> save(User user) {
        User saved = userService.save(user);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "保存失败!");
        if(saved.getId() != null) {
            result.put("status", 1);
            result.put("message", "保存成功!");
        }
        return result;
    }

    @RequestMapping(value = "/findUserName", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> findUserName(String userName) {
        User had = userService.findByUsername(userName);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        if(had.getId() != null) {
            result.put("status", 1);
        }
        return result;
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findOne(id));
        return "user/edit";
    }



    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{id}/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Long id) {
        int flag = userService.deleteUser(id);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "删除失败!");
        if(flag > 0) {
            result.put("status", 1);
            result.put("message", "删除成功!");
        }
        return result;
    }


    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/reset", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public  Map<String, Object> reset(@PathVariable("id") Long id) {
        int reset = userService.savePassword(id,null);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "重置失败!");
        if(reset > 0) {
            result.put("status", 1);
            result.put("message", "重置成功!");
        }
        return result;
    }


    private void setCommonData(Model model) {
        //model.addAttribute("organizationList", organizationService.findAll());
        model.addAttribute("roleList", roleService.findAll());
    }
}

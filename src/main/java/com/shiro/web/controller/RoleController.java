package com.shiro.web.controller;

import com.shiro.model.Role;
import com.shiro.service.ResourceService;
import com.shiro.service.RoleService;
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
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @RequiresPermissions("role:view")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("roleList", roleService.findAll());
        return "role/list";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        model.addAttribute("role", new Role());
        return "role/edit";
    }

    @RequiresPermissions("role:save")
    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> save(Role role) {
        Role saved = roleService.save(role);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "保存失败!");
        if(saved.getId() != null) {
            result.put("status", 1);
            result.put("message", "保存成功!");
        }
        return result;
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("role", roleService.findOne(id));
        return "role/edit";
    }


    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String showDeleteForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("role", roleService.findOne(id));
        return "role/edit";
    }

    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Long id) {
        int flag = roleService.deleteRole(id);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "删除失败!");
        if(flag > 0) {
            result.put("status", 1);
            result.put("message", "删除成功!");
        }
        return result;
    }

    private void setCommonData(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
    }

}

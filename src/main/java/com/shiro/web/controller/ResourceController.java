package com.shiro.web.controller;

import com.shiro.model.Resource;
import com.shiro.service.ResourceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/resource")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @ModelAttribute("types")
    public Resource.ResourceType[] resourceTypes() {
        return Resource.ResourceType.values();
    }

    @RequiresPermissions("resource:view")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
        return "resource/list";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentId") Long parentId, Model model) {
        Resource parent = resourceService.findOne(parentId);
        model.addAttribute("parent", parent);
        Resource child = new Resource();
        child.setParentId(parentId);
        child.setParentIds(parent.makeSelfAsParentIds());
        model.addAttribute("resource", child);
        return "resource/edit";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> save(Resource resource) {
        Resource saved = resourceService.saveResource(resource);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "保存失败!");
        if(saved.getId() != null) {
            result.put("status", 1);
            result.put("message", "保存成功!");
        }
        return result;
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        Resource resource = resourceService.findOne(id);
        model.addAttribute("resource", resource);
        model.addAttribute("parent", resourceService.findOne(resource.getParentId()));
        return "resource/edit";
    }


    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Long id) {
        int flag = resourceService.deleteResource(id);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "删除失败!");
        if(flag > 0) {
            result.put("status", 1);
            result.put("message", "删除成功!");
        }
        return result;
    }


}

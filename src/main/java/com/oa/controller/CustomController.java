package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.dto.CustomDto;
import com.oa.model.Custom;
import com.oa.service.CustomService;
import com.oa.utils.Page;
import com.oa.utils.Pagination;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

/**
 * 客户管理
 * @author YiMing on 2016/7/28.
 */
@Controller
@RequestMapping(value = "/custom")
public class CustomController {

    @Autowired
    private CustomService customService;


    @RequestMapping(value = "/findPage", method = RequestMethod.GET)
    public String findPage() {
        return "/custom/custom_list";
    }


    @RequestMapping(value = "findData",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Pagination<Custom> findData(@ModelAttribute("customDto")CustomDto customDto) {
        CustomDto param = new CustomDto();
        if(StringUtils.isNotBlank(customDto.getCode())) {
            customDto.setCode("%" + customDto.getCode() + "%");
        }
        if(StringUtils.isNotBlank(customDto.getName())) {
            customDto.setCode("%" + customDto.getName() + "%");
        }
        Pagination<Custom> customs = customService.findCustomByPage(param);
        return customs;
    }

    @RequestMapping(value = "validate",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> validate(@ModelAttribute("customDto")CustomDto customDto) {
        Custom had = customService.findCustom(customDto);
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "无此编号!");
        if(had != null) {
            result.put("status", 1);
            result.put("message", "编号已存在!");
        }
        return result;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
     public String add() {
        return "/custom/custom_add";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(value = "id",required = true)Long id,Model model) {
        model.addAttribute("custom", customService.findOne(id));
        return "/custom/custom_add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("customDto")CustomDto customDto) {
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "保存失败!");
        Custom flag = customService.save(customDto);
        if(flag != null) {
           result.put("status", 1);
           result.put("message", "保存成功!");
        }
        return result;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(value = "id",required = true)Long id, RedirectAttributes model) {
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        result.put("message", "删除失败!");
        int flag = customService.delete(id);
        if(flag > 0) {
            result.put("status", 1);
            result.put("message", "删除成功!");
        }
        return result;
    }

    /**
     * 查询客户(用于选择客户)
     * @param offset
     * @param limit
     * @param code
     * @param name
     * @return
     */
    @RequestMapping(value = "queryCustom",method = RequestMethod.GET)
    @ResponseBody
    public Page<CustomDto> queryCustom(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "code",required = false)String code,
           @RequestParam(value = "name",required = false)String name) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code", code);
        paramMap.put("name", name);
        Page<CustomDto> pages = new Page<CustomDto>();
        pages.setOffset(offset);
        pages.setLimit(limit);
        pages.setParamMap(paramMap);
        pages = customService.queryCustom(pages);
        return pages;
    }
}

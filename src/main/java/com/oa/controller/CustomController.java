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
import org.springframework.web.bind.WebDataBinder;
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

    @InitBinder("param")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("param.");
    }
//    @ModelAttribute("custom")
//    public Custom get(@RequestParam(required=false)Long id) {
//        if (StringUtils.isNotBlank(id.toString())){
//            return customService.findOne(id);
//        }else{
//            return new Custom();
//        }
//    }


    @RequestMapping(value = "/findPage", method = RequestMethod.GET)
    public String findPage() {
        return "/custom/custom_list";
    }


    @RequestMapping(value = "findData",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String findData(@ModelAttribute("customDto")CustomDto customDto) {
        CustomDto param = new CustomDto();
        if(StringUtils.isNotBlank(customDto.getCode())) {
            customDto.setCode("%" + customDto.getCode() + "%");
        }
        if(StringUtils.isNotBlank(customDto.getName())) {
            customDto.setCode("%" + customDto.getName() + "%");
        }
        Pagination<Custom> customs = customService.findCustomByPage(param);
        return JSON.toJSONString(customs);
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

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "id",required = false)Long id,
                             @RequestParam(value = "code",required = false)String code,
                             @RequestParam(value = "name",required = false)String name, RedirectAttributes model) {
        model.addAttribute("status", "保存失败!");
        CustomDto param = new CustomDto();
        if(id != null) {
            param.setId(id);
        }
        if(StringUtils.isNotBlank(code)) {
            param.setCode(code);
        }
        if(StringUtils.isNotBlank(name)) {
            param.setName(name);
        }
        Custom flag = customService.save(param);
        if(flag != null) {
            model.addAttribute("status", "保存成功!");
        }
        return "/custom/custom_list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@RequestParam(value = "id",required = true)Long id, RedirectAttributes model) {
        model.addAttribute("status", "保存失败!");
        int flag = customService.delete(id);
        if(flag > 0) {
            model.addAttribute("status", "删除成功!");
        }
        return "/custom/custom_list";
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

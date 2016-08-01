package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.dto.CustomDto;
import com.oa.model.Custom;
import com.oa.service.CustomService;
import com.oa.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
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
    public String findData(HttpServletRequest request, @ModelAttribute("param")CustomDto param) {
        Pagination<Custom> customs = customService.findCustomByPage(param, 0, 10);
        return JSON.toJSONString(customs);
    }
}

package com.oa.controller;

import com.oa.model.Custom;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 客户管理
 * @author YiMing on 2016/7/28.
 */
@Controller
@RequestMapping(value = "custom")
public class CustomController {

//    @Autowired
//    private CustomService customService;
//
//    @ModelAttribute("custom")
//    public Custom get(@RequestParam(required=false) String id) {
//        if (StringUtils.isNotBlank(id)){
//            return customService.getMenu(id);
//        }else{
//            return new Custom();
//        }
//    }


    public String list() {
        return "";
    }
}

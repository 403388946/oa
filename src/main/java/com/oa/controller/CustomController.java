package com.oa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 客户管理
 * @author YiMing on 2016/7/28.
 */
@Controller
@RequestMapping(value = "custom")
public class CustomController {

    public String list() {
        return "";
    }
}

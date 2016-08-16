package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.dto.AgreementInfoDto;
import com.oa.model.AgreementInfo;
import com.oa.service.AgreementInfoService;
import com.oa.utils.LoginUtils;
import com.oa.utils.OAExceptionHandler;
import com.oa.utils.Page;
import com.shiro.model.User;
import com.shiro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/8/15.
 */
@Controller
@RequestMapping(value = "agreementInfo")
public class AgreementInfoController {

    @Autowired
    private AgreementInfoService agreementInfoService;
    @Autowired
    private UserService userService;


    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 进入列表页
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "/agreementInfo/agreementInfoList";
    }
    /**
     * 进入新增页
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add() {
        return "/agreementInfo/agreementInfoAdd";
    }

    /**
     * 进入修改页
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String update(@RequestParam(value = "id", required = false)Long id, Model model) {
        AgreementInfoDto agreementInfoDto = agreementInfoService.selectByPrimaryKey(id);
        model.addAttribute("agreementInfo", agreementInfoDto);
        return "/agreementInfo/agreementInfoAdd";
    }

    /**
     * 获取列表数据
     * @param offset
     * @param limit
     * @param agreementVersion
     * @param agreementStartTime
     * @param agreementEndTime
     * @param testStartTime
     * @param testEndTime
     * @param customerName
     * @param employeeName
     * @return
     */
    @RequestMapping(value = "queryAgreementInfoByPage")
    @ResponseBody
    public String queryAgreementInfoByPage(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "version", defaultValue = "", required = false) String agreementVersion,
            @RequestParam(value = "agreementStartTimeStr", defaultValue = "", required = false) Date agreementStartTime,
            @RequestParam(value = "agreementEndTimeStr", defaultValue = "", required = false) Date agreementEndTime,
            @RequestParam(value = "testStartTimeStr", defaultValue = "", required = false) Date testStartTime,
            @RequestParam(value = "testEndTimeStr", defaultValue = "", required = false) Date testEndTime,
            @RequestParam(value = "customerName", defaultValue = "", required = false) String customerName,
            @RequestParam(value = "employeeName", defaultValue = "", required = false) String employeeName) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("agreementStartTime", agreementStartTime);
        paramMap.put("agreementEndTime", agreementEndTime);
        paramMap.put("testStartTime", testStartTime);
        paramMap.put("testEndTime", testEndTime);
        paramMap.put("customerName", customerName);
        paramMap.put("employeeName", employeeName);
        Page<AgreementInfoDto> pages = new Page<AgreementInfoDto>();
        pages.setOffset(offset);
        pages.setLimit(limit);
        pages.setParamMap(paramMap);
        pages = agreementInfoService.queryAgreementInfoByPage(pages);
        return JSON.toJSONString(pages);
    }


    /**
     * 保存数据
     * @param agreementInfo
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("agreementInfo") AgreementInfo agreementInfo) {
        Map<String, Object> result = new HashMap<>();
        try{
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            agreementInfo.setCreater(user.getId());
            int num = agreementInfoService.insert(agreementInfo);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "添加合同成功");
            }
        }catch (Exception e){
            new OAExceptionHandler(e);
            result.put("status", 0);
            result.put("msg", "添加合同失败");
        }
        return result;
    }

    /**
     * 保存修改员工信息
     * @param agreementInfo
     * @return
     */
    @RequestMapping(value = "updateSave", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateSave(@ModelAttribute("agreementInfo") AgreementInfo agreementInfo) {
        Map<String, Object> result = new HashMap<>();
        try{
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            agreementInfo.setUpdater(user.getId());
            int num = agreementInfoService.updateByPrimaryKeySelective(agreementInfo);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "修改合同成功");
            }
        }catch (Exception e){
            result.put("status", 0);
            result.put("msg", "修改合同失败");
        }
        return result;
    }

    /**
     * 导出员工数据
     * @param request
     * @param response
     */
    @RequestMapping(value = "exportExcel", method = RequestMethod.GET)
    public void exportExcel(
            @RequestParam(value = "version", defaultValue = "", required = false) String agreementVersion,
            @RequestParam(value = "agreementStartTimeStr", defaultValue = "", required = false) Date agreementStartTime,
            @RequestParam(value = "agreementEndTimeStr", defaultValue = "", required = false) Date agreementEndTime,
            @RequestParam(value = "testStartTimeStr", defaultValue = "", required = false) Date testStartTime,
            @RequestParam(value = "testEndTimeStr", defaultValue = "", required = false) Date testEndTime,
            @RequestParam(value = "customerName", defaultValue = "", required = false) String customerName,
            @RequestParam(value = "employeeName", defaultValue = "", required = false) String employeeName,
            HttpServletRequest request, HttpServletResponse response) {
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("agreementStartTime", agreementStartTime);
            paramMap.put("agreementEndTime", agreementEndTime);
            paramMap.put("testStartTime", testStartTime);
            paramMap.put("testEndTime", testEndTime);
            paramMap.put("customerName", customerName);
            paramMap.put("employeeName", employeeName);
        List<AgreementInfoDto> list = agreementInfoService.selectAgreementInfoByMap(paramMap);
        if (list != null && list.size() > 0) {
            agreementInfoService.export(list, request, response);
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(value = "id", defaultValue = "") Long id) {
        Map<String, Object> result = new HashMap<>();
        try {
            AgreementInfo agreementInfo = new AgreementInfo();
            agreementInfo.setId(id);
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            agreementInfo.setUpdater(user.getId());
            int num = agreementInfoService.delete(agreementInfo);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "删除合同成功");
            }
        }catch (Exception e){
            result.put("status", 0);
            result.put("msg", "删除合同失败");
        }
        return result;
    }

}

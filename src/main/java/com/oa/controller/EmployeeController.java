package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.dto.EmployeeDto;
import com.oa.model.Employee;
import com.oa.service.EmployeeService;
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
 * Created by 46637 on 2016/7/26.
 */
@RequestMapping(value = "/employee")
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private UserService userService;

    /**
     * 进入列表页
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "/employee/employee_list";
    }
    /**
     * 进入新增页
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add() {
        return "/employee/employee_add";
    }

    /**
     * 进入修改页
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String update(@RequestParam(value = "id", required = false)Long id, Model model) {
        Employee employee = employeeService.findOne(id);
        model.addAttribute("employee", employee);
        return "/employee/employee_add";
    }

    /**
     * 获取列表数据
     * @param offset
     * @param limit
     * @param code
     * @param name
     * @param idCard
     * @param customName
     * @return
     */
    @RequestMapping(value = "getEmployeeList")
    @ResponseBody
    public String getEmployeeList(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "code", defaultValue = "", required = false) String code,
            @RequestParam(value = "name", defaultValue = "", required = false) String name,
            @RequestParam(value = "idCard", defaultValue = "", required = false) String idCard,
            @RequestParam(value = "customName", defaultValue = "", required = false) String customName) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code", code);
        paramMap.put("name", name);
        paramMap.put("idCard", idCard);
        paramMap.put("customName", customName);
        Page<EmployeeDto> pages = new Page<EmployeeDto>();
        pages.setOffset(offset);
        pages.setLimit(limit);
        pages.setParamMap(paramMap);
        pages = employeeService.findEmployeeByPage(pages);
        return JSON.toJSONString(pages);
    }

    /**
     * 保存数据
     * @param employeeDto
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("employeeDto") EmployeeDto employeeDto) {
        Map<String, Object> result = new HashMap<>();
        try{
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            employeeDto.setCreater(user.getId());
            int num = employeeService.save(employeeDto);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "添加员工成功");
            }
        }catch (Exception e){
            new OAExceptionHandler(e);
            result.put("status", 0);
            result.put("msg", "添加员工失败");
        }
        return result;
    }

    /**
     * 保存数据
     * @param employeeDto
     * @return
     */
    @RequestMapping(value = "bindAgreement", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> bindAgreement(@ModelAttribute("employeeDto") EmployeeDto employeeDto) {
        Map<String, Object> result = new HashMap<>();
        try{
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            employeeDto.setCreater(user.getId());
            int num = employeeService.save(employeeDto);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "添加员工成功");
            }
        }catch (Exception e){
            result.put("status", 0);
            result.put("msg", "添加员工失败");
        }
        return result;
    }

    /**
     * 保存修改员工信息
     * @param employeeDto
     * @return
     */
    @RequestMapping(value = "updateSave", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateSave(@ModelAttribute("employeeDto") EmployeeDto employeeDto) {
        Map<String, Object> result = new HashMap<>();
        try{
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            employeeDto.setUpdater(user.getId());
            int num = employeeService.update(employeeDto);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "修改员工成功");
            }
        }catch (Exception e){
            result.put("status", 0);
            result.put("msg", "修改员工失败");
        }
        return result;
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 导出员工数据
     * @param request
     * @param response
     */
    @RequestMapping(value = "exportExcel", method = RequestMethod.GET)
    public void exportExcel( @RequestParam(value = "code", defaultValue = "") String code,
                             @RequestParam(value = "name", defaultValue = "") String name,
                             @RequestParam(value = "idCard", defaultValue = "") String idCard,
                             @RequestParam(value = "customName", defaultValue = "") String customName,
                             HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code", code);
        paramMap.put("name", name);
        paramMap.put("idCard", idCard);
        paramMap.put("customName", customName);
        List<EmployeeDto> list = employeeService.selectEmployee(paramMap);
        if (list != null && list.size() > 0) {
            employeeService.export(list, request, response);
        }
    }

    /**
     * 判断身份证号是否已存在
     * @param idCard
     */
    @RequestMapping(value = "repeatIdCard", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> repeatIdCard(@RequestParam(value = "id", defaultValue = "") String id,
                             @RequestParam(value = "idCard", defaultValue = "") String idCard) {
        Map<String, Object> result = new HashMap<>();
        boolean flag = employeeService.selectEmployeeByIdCard(id, idCard);
        if(flag){
            result.put("status", 1);
        }else{
            result.put("status", 0);
        }
        return result;
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
            EmployeeDto employeeDto = new EmployeeDto();
            employeeDto.setId(id);
            String loginName = LoginUtils.getCurrentUserLoginName();
            User user = userService.findByUsername(loginName);
            employeeDto.setUpdater(user.getId());
            int num = employeeService.delete(employeeDto);
            if(num > 0){
                result.put("status", 1);
                result.put("msg", "删除员工成功");
            }
        }catch (Exception e){
            result.put("status", 0);
            result.put("msg", "删除员工失败");
        }
        return result;
    }

}

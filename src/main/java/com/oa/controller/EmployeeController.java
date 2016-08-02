package com.oa.controller;

import com.oa.dto.EmployeeDto;
import com.oa.model.Employee;
import com.oa.service.EmployeeService;
import com.oa.utils.Page;
import com.oa.utils.Pagination;
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
     * 进入选择客户页
     * @return
     */
    @RequestMapping(value = "customerList", method = RequestMethod.GET)
    public String customerList() {
        return "/employee/customerList";
    }

    /**
     * 获取列表数据
     * @param offset
     * @param limit
     * @param code
     * @param name
     * @param idCard
     * @param customName
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "getEmployeeList")
    @ResponseBody
    public Page<EmployeeDto> getEmployeeList(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "code", defaultValue = "", required = false) String code,
            @RequestParam(value = "name", defaultValue = "", required = false) String name,
            @RequestParam(value = "idCard", defaultValue = "", required = false) String idCard,
            @RequestParam(value = "customName", defaultValue = "", required = false) String customName,
            HttpServletRequest request,HttpServletResponse response, Model model) {
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
        return pages;
    }

    /**
     * 保存数据
     * @param employeeDto
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(EmployeeDto employeeDto) {
        employeeService.save(employeeDto);
        return "/employee/employee_list";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                dateFormat, true));
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
}

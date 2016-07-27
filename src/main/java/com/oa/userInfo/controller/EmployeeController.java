package com.oa.userInfo.controller;

import com.oa.userInfo.dto.EmployeeDto;
import com.oa.userInfo.model.Employee;
import com.oa.userInfo.service.EmployeeService;
import com.oa.userInfo.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
     * 获取列表数据
     * @param employeeDto
     * @return
     */
    @RequestMapping(value = "getEmployeeList", method = RequestMethod.GET)
    @ResponseBody
    public Pagination<Employee> getEmployeeList(EmployeeDto employeeDto) {
        Pagination<Employee> page = employeeService.findEmployeeByPage(employeeDto);
        return page;
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

    /**
     * 导出员工数据
     * @param request
     * @param response
     */
    @RequestMapping(value = "exportExcel", method = RequestMethod.GET)
    public void exportExcel(EmployeeDto employeeDto, HttpServletRequest request, HttpServletResponse response) {
        List<Employee> list = employeeService.selectEmployee(employeeDto);
        if (list != null && list.size() > 0) {
            employeeService.export(list, request, response);
        }
    }
}

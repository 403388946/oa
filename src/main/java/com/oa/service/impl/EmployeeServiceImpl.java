package com.oa.service.impl;

import com.oa.dto.EmployeeDto;
import com.oa.mapper.EmployeeMapper;
import com.oa.model.Employee;
import com.oa.service.EmployeeService;
import com.oa.utils.ExcelData;
import com.oa.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/7/26.
 */
@Service(value = "employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public void save(EmployeeDto emp) {
        employeeMapper.insertSelective(emp);
    }

    public void update(EmployeeDto emp) {
        employeeMapper.updateByPrimaryKey(emp);
    }

    public Pagination<Employee> findEmployeeByPage(EmployeeDto empDto) {
        Pagination<Employee> page = new Pagination<Employee>();
        List<Employee> list = employeeMapper.findEmployeeByPage(empDto);
        if (list == null || list.size() == 0) {
            page.setRows(list);
            page.setTotal(0);
        } else {
            //查询留言与议价总数
            int total = employeeMapper.findEmployeeByPageCount(empDto);
            page.setRows(list);
            page.setTotal(total);
        }
        return page;
    }

    public List<Employee> selectEmployee(EmployeeDto empDto) {
        List<Employee> list = employeeMapper.findEmployeeByPage(empDto);
        return list;
    }

    public Employee findOne(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    /**
     * 导出员工信息
     * @param emps  员工信息
     * @param request   请求
     * @param response  响应
     */
    public void export(List<Employee> emps, HttpServletRequest request, HttpServletResponse response) {
        //sheet
        List<List<String>> fileData = new ArrayList();
        //文件头-第一行
        List<String> fileHead = new ArrayList();
        fileHead.add("编号");
        fileHead.add("姓名");
        fileHead.add("身份证号码");
        fileHead.add("客户编号");
        fileHead.add("客户报价单号");
        fileHead.add("客户名称");
        fileHead.add("入职日期");
        fileHead.add("工资卡号");
        fileHead.add("在职状态");
        fileHead.add("用工形式");
        fileData.add(fileHead);
        //文件体-2~n行
        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        for(Employee employee : emps){
            List<String> fileBody = new ArrayList();
            fileBody.add(employee.getCode());
            fileBody.add(employee.getName());
            fileBody.add(employee.getIdCard());
            fileBody.add(employee.getCustomCode());
            fileBody.add(employee.getCustomPriceNum());
            fileBody.add(employee.getCustomName());
            fileBody.add(employee.getJionDate() != null ? sdf.format(employee.getJionDate()) : "");
            fileBody.add(employee.getPayCode());
            fileBody.add(employee.getServiceStatus() == 0 ? "离职" : employee.getServiceStatus() == 1 ? "在职" : employee.getServiceStatus() == 2 ? "离职申请中" : "");
            fileBody.add(employee.getEmploymentForm() == 1 ? "代理" : employee.getEmploymentForm() == 2 ? "派遣" : "");
            fileData.add(fileBody);
        }
        //excel
        Map<String, List<List<String>>> fileMap = new HashMap();
        fileMap.put("员工信息", fileData);

        String filePath = request.getSession().getServletContext().getRealPath("/") + "assets" + "/excel" +  "员工信息" +".xls";
        String fileName = "员工信息";
        ExcelData.exportFile(fileMap, filePath, response, request, fileName);
    }
}

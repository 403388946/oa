package com.oa.service.impl;

import com.oa.dto.EmployeeDto;
import com.oa.mapper.EmployeeMapper;
import com.oa.model.Employee;
import com.oa.service.EmployeeService;
import com.oa.utils.ExcelData;
import com.oa.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 46637 on 2016/7/26.
 */
@Service(value = "employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;


    public int save(EmployeeDto emp) {
        return employeeMapper.insert(emp);
    }

    public int update(EmployeeDto emp) {
        return employeeMapper.updateByPrimaryKeySelective(emp);
    }

    @Override
    public int delete(EmployeeDto emp) {
        emp.setIsDel(1);
        return employeeMapper.updateByPrimaryKeySelective(emp);
    }

    public Page<EmployeeDto> findEmployeeByPage(Page<EmployeeDto> page) {
        List<EmployeeDto> list = employeeMapper.findEmployeeByPage(page);
        int total = employeeMapper.findEmployeeByPageCount(page);
        page.setRows(list);
        page.setTotal(total);
        return page;
    }

    public List<EmployeeDto> selectEmployee(Map<String, Object> paramMap) {
        List<EmployeeDto> list = employeeMapper.selectEmployeeByMap(paramMap);
        return list;
    }

    public EmployeeDto findOne(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    /**
     * 导出员工信息
     * @param emps  员工信息
     * @param request   请求
     * @param response  响应
     */
    public void export(List<EmployeeDto> emps, HttpServletRequest request, HttpServletResponse response) {
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
            fileBody.add(employee.getJoinDate() != null ? sdf.format(employee.getJoinDate()) : "");
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

    @Override
    public boolean selectEmployeeByIdCard(String id, String idCard) {
        Employee emp = employeeMapper.selectEmployeeByIdCard(idCard);
         if(StringUtils.isNotEmpty(id)){
            Employee entity = employeeMapper.selectByPrimaryKey(Long.parseLong(id));
            return emp == null || emp.getId().longValue() == entity.getId().longValue();
        }else{
            return emp == null;
        }
    }
}

package com.oa.userInfo.service.impl;

import com.oa.userInfo.dto.EmployeeDto;
import com.oa.userInfo.mapper.EmployeeMapper;
import com.oa.userInfo.model.Employee;
import com.oa.userInfo.service.EmployeeService;
import com.oa.userInfo.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

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
}

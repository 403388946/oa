package com.oa.mapper;

import com.oa.dto.EmployeeDto;
import com.oa.model.Employee;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(EmployeeDto employee);

    int insertSelective(EmployeeDto employee);

    Employee selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EmployeeDto employee);

    int updateByPrimaryKey(EmployeeDto employee);

    List<Employee> findEmployeeByPage(EmployeeDto empDto);

    int findEmployeeByPageCount(EmployeeDto empDto);
}
package com.oa.mapper;

import com.oa.dto.EmployeeDto;
import com.oa.model.Employee;
import com.oa.utils.Page;

import java.util.List;
import java.util.Map;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(EmployeeDto employee);

    int insertSelective(EmployeeDto employee);

    EmployeeDto selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EmployeeDto employee);

    int updateByPrimaryKey(EmployeeDto employee);

    List<EmployeeDto> findEmployeeByPage(Page<EmployeeDto> page);

    int findEmployeeByPageCount(Page<EmployeeDto> page);

    List<EmployeeDto> selectEmployeeByMap(Map<String, Object> paramMap);

    Employee selectEmployeeByIdCard(String idCard);
}
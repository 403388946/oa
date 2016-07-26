package com.oa.userInfo.service;

import com.oa.userInfo.dto.EmployeeDto;
import com.oa.userInfo.model.Employee;
import com.oa.userInfo.utils.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 46637 on 2016/7/26.
 */
@Service
public interface EmployeeService {

    /**
     * 保存
     * @param emp
     */
    void save(EmployeeDto emp);

    /**
     * 修改
     * @param emp
     */
    void update(EmployeeDto emp);

    /**
     * 分页查询
     * @param empDto
     * @return
     */
    Pagination<Employee> findEmployeeByPage(EmployeeDto empDto);

    /**
     * 按条件查询员工
     * @param empDto
     * @return
     */
    List<Employee> selectEmployee(EmployeeDto empDto);

    /**
     * 根据id查询员工信息
     * @param id
     * @return
     */
    Employee findOne(Long id);
}

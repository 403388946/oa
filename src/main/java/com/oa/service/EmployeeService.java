package com.oa.service;

import com.oa.dto.EmployeeDto;
import com.oa.model.Employee;
import com.oa.utils.Page;
import com.oa.utils.Pagination;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

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
     * @param pages
     * @return
     */
    Page<EmployeeDto> findEmployeeByPage(Page<EmployeeDto> pages);

    /**
     * 按条件查询员工
     * @param paramMap
     * @return
     */
    List<EmployeeDto> selectEmployee(Map<String, Object> paramMap);

    /**
     * 根据id查询员工信息
     * @param id
     * @return
     */
    Employee findOne(Long id);

    /**
     * 导出员工信息
     * @param emps  员工信息
     * @param request   请求
     * @param response  响应
     */
    public void export(List<EmployeeDto> emps, HttpServletRequest request, HttpServletResponse response);
}

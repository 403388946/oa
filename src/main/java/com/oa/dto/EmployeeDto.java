package com.oa.dto;

import com.oa.model.Employee;
import com.oa.utils.BaseDto;

import java.util.Date;

/**
 * 员工表
 * Created by 46637 on 2016/7/26.
 */
public class EmployeeDto extends Employee{

    private String joinDateStr;

    public String getJoinDateStr() {
        return joinDateStr;
    }

    public void setJoinDateStr(String joinDateStr) {
        this.joinDateStr = joinDateStr;
    }
}

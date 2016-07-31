package com.oa.mapper;

import com.oa.dto.CustomDto;
import com.oa.model.Custom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 客户管理
 * @author Yiming on 2016/7/31.
 */
public interface CustomMapper {

    int insert(CustomDto param);
    int update(CustomDto param);
    int delete(@Param("id")Long id);
    Custom findOne(@Param("id")Long id);
    List<Custom> findCustomByPage(CustomDto param);
    Integer findCustomByPageCount(CustomDto param);
}

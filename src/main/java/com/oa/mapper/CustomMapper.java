package com.oa.mapper;

import com.oa.dto.CustomDto;
import com.oa.model.Custom;
import com.oa.utils.Page;
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
    Custom findCustom(CustomDto param);

    /**
     * 查询客户(用于选择客户)
     * @param page
     * @return
     */
    List<CustomDto> queryCustom(Page<CustomDto> page);
    Integer queryCustomCount (Page<CustomDto> page);
}

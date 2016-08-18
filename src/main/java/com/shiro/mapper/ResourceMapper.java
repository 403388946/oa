package com.shiro.mapper;

import com.oa.utils.Page;
import com.shiro.model.Resource;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ResourceMapper {

    int deleteByPrimaryKey(@Param("id")Long id);

    int insert(Resource record);


    Resource selectByPrimaryKey(@Param("id")Long id);

    int updateByPrimaryKeySelective(Resource record);


    List<Resource> findResources(Page page);
    List<Resource> findAll();

    List<Resource> findResourcesByParentId(@Param("parentId")Long parentId);
}
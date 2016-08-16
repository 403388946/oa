package com.shiro.mapper;

import com.shiro.model.Resource;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ResourceMapper {

    int deleteByPrimaryKey(@Param("id")Long id);

    int insert(Resource record);


    Resource selectByPrimaryKey(@Param("id")Long id);

    int updateByPrimaryKeySelective(Resource record);


    List<Resource> findResources(@Param("name")String name, @Param("start")int start, @Param("pageSize")int pageSize);
    List<Resource> findResourcesByParentId(@Param("parentId")Long parentId);
}
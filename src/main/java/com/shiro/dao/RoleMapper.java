package com.shiro.dao;

import com.shiro.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RoleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_role",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_role (id, role, ",
        "description, resource_ids, ",
        "available)",
        "values (#{id,jdbcType=BIGINT}, #{role,jdbcType=VARCHAR}, ",
        "#{description,jdbcType=VARCHAR}, #{resourceIds,jdbcType=VARCHAR}, ",
        "#{available,jdbcType=BIT})"
    })
    int insert(Role record);

    int insertSelective(Role record);


    Role selectByPrimaryKey(@Param("id")Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Role record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role
     *
     * @mbggenerated
     */
    @Update({
        "update sys_role",
        "set role = #{role,jdbcType=VARCHAR},",
          "description = #{description,jdbcType=VARCHAR},",
          "resource_ids = #{resourceIds,jdbcType=VARCHAR},",
          "available = #{available,jdbcType=BIT}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(Role record);


    List<Role> findRoles(@Param("description")String description, @Param("start")int start, @Param("pageSize")int pageSize);
}
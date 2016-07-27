package com.shiro.dao;

import com.shiro.entity.Organization;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrganizationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_organization",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_organization (id, name, ",
        "parent_id, parent_ids, ",
        "available)",
        "values (#{id,jdbcType=BIGINT}, #{name,jdbcType=VARCHAR}, ",
        "#{parentId,jdbcType=BIGINT}, #{parentIds,jdbcType=VARCHAR}, ",
        "#{available,jdbcType=BIT})"
    })
    int insert(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    int insertSelective(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, name, parent_id, parent_ids, available",
        "from sys_organization",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ResultMap("BaseResultMap")
    Organization selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_organization
     *
     * @mbggenerated
     */
    @Update({
        "update sys_organization",
        "set name = #{name,jdbcType=VARCHAR},",
          "parent_id = #{parentId,jdbcType=BIGINT},",
          "parent_ids = #{parentIds,jdbcType=VARCHAR},",
          "available = #{available,jdbcType=BIT}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(Organization record);

    List<Organization> findOrganizations(@Param("name")String name, @Param("start")int start, @Param("pageSize")int pageSize);
}
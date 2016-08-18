package com.shiro.service;


import com.shiro.model.Role;

import java.util.List;
import java.util.Set;

public interface RoleService {


    Role save(Role role);
    Role updateRole(Role role);
    int deleteRole(Long roleId);

    Role findOne(Long roleId);
    List<Role> findAll();

    /**
     * 根据角色编号得到角色标识符列表
     * @param roleIds
     * @return
     */
    Set<String> findRoles(Long... roleIds);

    /**
     * 根据角色编号得到权限字符串列表
     * @param roleIds
     * @return
     */
    Set<String> findPermissions(Long[] roleIds);
}

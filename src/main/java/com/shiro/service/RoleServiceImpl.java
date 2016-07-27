package com.shiro.service;

import com.shiro.dao.RoleMapper;
import com.shiro.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service(value = "roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private ResourceService resourceService;

    public Role createRole(Role role) {
        if(roleMapper.insert(role) > 0) {
            return role;
        }
        return null;
    }

    public Role updateRole(Role role) {
        if(roleMapper.updateByPrimaryKey(role) > 0) {
            return role;
        }
        return null;
    }

    public int deleteRole(Long roleId) {
        return roleMapper.deleteByPrimaryKey(roleId);
    }

    @Override
    public Role findOne(Long roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public List<Role> findAll() {
        return roleMapper.findRoles(null, 0, 0);
    }

    @Override
    public Set<String> findRoles(Long... roleIds) {
        Set<String> roles = new HashSet<String>();
        for(Long roleId : roleIds) {
            Role role = findOne(roleId);
            if(role != null) {
                roles.add(role.getRole());
            }
        }
        return roles;
    }

    @Override
    public Set<String> findPermissions(Long[] roleIds) {
        Set<Long> resourceIds = new HashSet<Long>();
        for(Long roleId : roleIds) {
            Role role = findOne(roleId);
            if(role != null) {
                resourceIds.addAll(role.getResourceIdsList());
            }
        }
        return resourceService.findPermissions(resourceIds);
    }
}

package com.shiro.service;


import com.oa.utils.Page;
import com.shiro.mapper.ResourceMapper;
import com.shiro.model.Resource;
import com.sys.SysConstants;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service(value = "resourceService")
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public Resource saveResource(Resource resource) {
        if(resource.getId() != null) {
            if(resourceMapper.updateByPrimaryKeySelective(resource) > 0) {
                return resourceMapper.selectByPrimaryKey(resource.getId());
            }
        } else {
            if(resourceMapper.insert(resource) > 0) {
                return resourceMapper.selectByPrimaryKey(resource.getId());
            }
        }

        return null;
    }

    @Override
    public Resource updateResource(Resource resource) {
        if(resourceMapper.updateByPrimaryKeySelective(resource) > 0) {
            return resourceMapper.selectByPrimaryKey(resource.getId());
        }
        return null;
    }

    @Override
    public int deleteResource(Long resourceId) {
        return resourceMapper.deleteByPrimaryKey(resourceId);
    }

    @Override
    public Resource findOne(Long resourceId) {
        return resourceMapper.selectByPrimaryKey(resourceId);
    }

    @Override
    public List<Resource> findAll(Page page) {
        return resourceMapper.findResources(page);
    }

    @Override
    public List<Resource> findAll() {
        return resourceMapper.findAll();
    }

    @Override
    public List<Resource> findResourcesByParentId(Long parentId) {
        return resourceMapper.findResourcesByParentId(parentId);
    }

    @Override
    public Set<String> findPermissions(Set<Long> resourceIds) {
        Set<String> permissions = new HashSet<String>();
        for(Long resourceId : resourceIds) {
            Resource resource = findOne(resourceId);
            if(resource != null && !StringUtils.isEmpty(resource.getPermission())) {
                permissions.add(resource.getPermission());
            }
        }
        return permissions;
    }

    @Override
    public List<Resource> findMenus(Set<String> permissions) {
        List<Resource> allResources = findAll();
        List<Resource> menus = new ArrayList<Resource>();
        for(Resource resource : allResources) {
            if(resource.isRootNode()) {
                continue;
            }
            if(resource.getType() != Resource.ResourceType.menu) {
                continue;
            }
            if(!hasPermission(permissions, resource)) {
                continue;
            }
            menus.add(resource);
        }
        return menus;
    }

    @Override
    public List<Resource> findMenusByRootId(Set<String> permissions, Long parentId) {
        List<Resource> menus = new ArrayList<Resource>();
        //查所有一级菜单
        List<Resource> oneLevelMenus = resourceMapper.findResourcesByParentId(parentId);
        for(Resource parent : oneLevelMenus) {
            if(parent.isRootNode()) {
                continue;
            }
            if(parent.getType() != Resource.ResourceType.menu) {
                continue;
            }
            if(!hasPermission(permissions, parent)) {
                continue;
            }
            parent.setChildren(this.findMenusByRootId(permissions, parent.getId()));
            menus.add(parent);
        }
        return menus;
    }


    private boolean hasPermission(Set<String> permissions, Resource resource) {
        if(StringUtils.isEmpty(resource.getPermission())) {
            return true;
        }
        for(String permission : permissions) {
            WildcardPermission p1 = new WildcardPermission(permission);
            WildcardPermission p2 = new WildcardPermission(resource.getPermission());
            if(p1.implies(p2) || p2.implies(p1)) {
                return true;
            }
        }
        return false;
    }
}

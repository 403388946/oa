package com.shiro.service;


import com.shiro.model.Resource;

import java.util.List;
import java.util.Set;


public interface ResourceService {


    Resource createResource(Resource resource);
    Resource updateResource(Resource resource);
    int deleteResource(Long resourceId);

    Resource findOne(Long resourceId);
    List<Resource> findAll();

    List<Resource> findResourcesByParentId(Long parentId);

    /**
     * 得到资源对应的权限字符串
     * @param resourceIds
     * @return
     */
    Set<String> findPermissions(Set<Long> resourceIds);

    /**
     * 根据用户权限得到菜单
     * @param permissions
     * @return
     */
    List<Resource> findMenus(Set<String> permissions);

    List<Resource> findMenusByRootId(Set<String> permissions, Long parentId);
}

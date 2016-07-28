package com.shiro.service;


import com.shiro.model.Organization;

import java.util.List;


public interface OrganizationService {


    Organization createOrganization(Organization organization);
    Organization updateOrganization(Organization organization);
    int deleteOrganization(Long organizationId);

    Organization findOne(Long organizationId);
    List<Organization> findAll();

//    Object findAllWithExclude(Organization excludeOraganization);
//
//    void move(Organization source, Organization target);
}

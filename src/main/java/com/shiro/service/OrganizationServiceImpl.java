package com.shiro.service;

import com.shiro.dao.OrganizationMapper;
import com.shiro.entity.Organization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service(value = "organizationService")
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public Organization createOrganization(Organization organization) {
        if(organizationMapper.insert(organization) > 0) {
            return organization;
        }
        return null;
    }

    @Override
    public Organization updateOrganization(Organization organization) {
        if(organizationMapper.updateByPrimaryKey(organization) > 0) {
            return organization;
        }
        return null;
    }

    @Override
    public int deleteOrganization(Long organizationId) {
        return organizationMapper.deleteByPrimaryKey(organizationId);
    }

    @Override
    public Organization findOne(Long organizationId) {
        return organizationMapper.selectByPrimaryKey(organizationId);
    }

    @Override
    public List<Organization> findAll() {
        return organizationMapper.findOrganizations(null, 0, 0);
    }

//    @Override
//    public List<Organization> findAllWithExclude(Organization excludeOraganization) {
//        return organizationDao.findAllWithExclude(excludeOraganization);
//    }
//
//    @Override
//    public void move(Organization source, Organization target) {
//        organizationDao.move(source, target);
//    }
}

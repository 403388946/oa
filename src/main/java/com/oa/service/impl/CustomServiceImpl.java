package com.oa.service.impl;

import com.oa.dto.CustomDto;
import com.oa.mapper.CustomMapper;
import com.oa.model.Custom;
import com.oa.service.CustomService;
import com.oa.utils.LoginUtils;
import com.oa.utils.Page;
import com.oa.utils.Pagination;
import com.shiro.mapper.UserMapper;
import com.shiro.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author YiMing on 2016/7/31.
 */
@Service(value = "customService")
@Transactional
public class CustomServiceImpl implements CustomService {

    @Autowired
    private CustomMapper customMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public Custom save(CustomDto param) {
        String userLoginName= LoginUtils.getCurrentUserLoginName();
        User current = userMapper.findUserByName(userLoginName);
        param.setCreater(current.getId());
        if(param.getId() == null) {
            customMapper.insert(param);
        } else {
            param.setIsDel(0);
            customMapper.update(param);
        }
        return customMapper.findOne(param.getId());
    }

    @Override
    public int delete(Long id) {
        return customMapper.delete(id);
    }

    @Override
    public Custom findOne(Long id) {
        return customMapper.findOne(id);
    }

    @Override
    public Pagination<Custom> findCustomByPage(CustomDto param) {
        Pagination<Custom> page = new Pagination<>();
        page.setCurrentPage(param.getCurrentPage());
        page.setPageSize(param.getPageSize());
        param.setStartItem(page.getPageNum());
        List<Custom> customs = customMapper.findCustomByPage(param);
        Integer total = customMapper.findCustomByPageCount(param);
        page.setRows(customs);
        page.setTotal(total);
        return page;
    }

    @Override
    public Integer findCustomByPageCount(CustomDto param) {
        return customMapper.findCustomByPageCount(param);
    }

    @Override
    public Page<CustomDto> queryCustom(Page<CustomDto> page) {
        List<CustomDto> list = customMapper.queryCustom(page);
        page.setRows(list);
        return page;
    }

    @Override
    public Custom findCustom(CustomDto param) {
        return customMapper.findCustom(param);
    }
}

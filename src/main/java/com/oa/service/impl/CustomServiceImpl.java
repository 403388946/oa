package com.oa.service.impl;

import com.oa.dto.CustomDto;
import com.oa.mapper.CustomMapper;
import com.oa.model.Custom;
import com.oa.service.CustomService;
import com.oa.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author YiMing on 2016/7/31.
 */
@Service(value = "customService")
public class CustomServiceImpl implements CustomService {

    @Autowired
    private CustomMapper customMapper;

    @Override
    public Custom save(CustomDto param) {
        if(param.getId() == null) {
            customMapper.insert(param);
        } else {
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
        page.setPageSize(page.getPageSize());
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
}

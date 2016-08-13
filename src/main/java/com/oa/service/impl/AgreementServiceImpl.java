package com.oa.service.impl;

import com.oa.dto.AgreementDto;
import com.oa.mapper.AgreementMapper;
import com.oa.model.Agreement;
import com.oa.service.AgreementService;
import com.oa.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/8/11.
 */
@Service(value = "agreementService")
public class AgreementServiceImpl implements AgreementService {

    @Autowired
    private AgreementMapper agreementMapper;

    /**
     * 新增
     * @param agreement
     * @return
     */
    @Override
    public int insert(Agreement agreement) {
        return agreementMapper.insert(agreement);
    }

    /**
     * 根据id查询报价单号信息
     * @param id
     * @return
     */
    @Override
    public Agreement selectByPrimaryKey(Long id) {
        return agreementMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据条件修改
     * @param agreement
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Agreement agreement) {
        return agreementMapper.updateByPrimaryKeySelective(agreement);
    }

    /**
     * 根据条件分页查询报价单号信息
     * @param page
     * @return
     */
    @Override
    public Page<AgreementDto> findAgreementByPage(Page<AgreementDto> page) {
        List<AgreementDto> list = agreementMapper.findAgreementByPage(page);
        if(list != null && list.size() > 0){
            page.setTotal(list.size());
        }else{
            page.setTotal(0);
        }
        page.setRows(list);
        return page;
    }

    /**
     * 根据条件分页查询报价单号信息(用于选择报价单号信息)
     * @param page
     * @return
     */
    @Override
    public Page<AgreementDto> queryAgreementByMap(Page<AgreementDto> page) {
        List<AgreementDto> list = agreementMapper.queryAgreementByMap(page);
        if(list != null && list.size() > 0){
            page.setTotal(list.size());
        }else{
            page.setTotal(0);
        }
        page.setRows(list);
        return page;
    }
}

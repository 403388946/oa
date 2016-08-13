package com.oa.service;

import com.oa.dto.AgreementDto;
import com.oa.model.Agreement;
import com.oa.utils.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/8/11.
 */
public interface AgreementService {

    /**
     * 新增
     * @param agreement
     * @return
     */
    int insert(Agreement agreement);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Agreement selectByPrimaryKey(Long id);

    /**
     * 根据条件修改
     * @param agreement
     * @return
     */
    int updateByPrimaryKeySelective(Agreement agreement);

    /**
     * 根据条件查询报价单号数据（分页）
     * @param page
     * @return
     */
    Page<AgreementDto> findAgreementByPage(Page<AgreementDto> page);

    /**
     * 根据条件查询报价单号数据（用于选择报价单号）
     * @param page
     * @return
     */
    Page<AgreementDto> queryAgreementByMap(Page<AgreementDto> page);
}

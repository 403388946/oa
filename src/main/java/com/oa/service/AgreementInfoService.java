package com.oa.service;

import com.oa.dto.AgreementInfoDto;
import com.oa.model.AgreementInfo;
import com.oa.utils.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/8/14.
 */
public interface AgreementInfoService {

    /**
     * 删除
     * @param agreementInfo
     * @return
     */
    int delete(AgreementInfo agreementInfo);

    /**
     * 新增
     * @param agreementInfo
     * @return
     */
    int insert(AgreementInfo agreementInfo);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    AgreementInfoDto selectByPrimaryKey(Long id);

    /**
     * 根据条件修改
     * @param agreementInfo
     * @return
     */
    int updateByPrimaryKeySelective(AgreementInfo agreementInfo);

    /**
     * 根据条件查询合同信息（分页）
     * @param page
     * @return
     */
    Page<AgreementInfoDto> queryAgreementInfoByPage(Page<AgreementInfoDto> page);

    /**
     * 根据条件查询合同信息（用于导出）
     * @param map
     * @return
     */
    List<AgreementInfoDto> selectAgreementInfoByMap(Map<String, Object> map);

    /**
     * 导出合同信息
     * @param agreementInfoDtos
     * @param request
     * @param response
     */
    void export(List<AgreementInfoDto> agreementInfoDtos, HttpServletRequest request, HttpServletResponse response);
}

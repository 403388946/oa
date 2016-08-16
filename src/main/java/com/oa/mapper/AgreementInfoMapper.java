package com.oa.mapper;

import com.oa.dto.AgreementInfoDto;
import com.oa.model.AgreementInfo;
import com.oa.utils.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AgreementInfoMapper {
    /**
     * 删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Long id);

    /**
     * 新增
     * @param agreementInfo
     * @return
     */
    int insert(AgreementInfo agreementInfo);

    /**
     * 根据条件新增
     * @param agreementInfo
     * @return
     */
    int insertSelective(AgreementInfo agreementInfo);

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
     * 修改
     * @param agreementInfo
     * @return
     */
    int updateByPrimaryKey(AgreementInfo agreementInfo);

    /**
     * 根据条件查询合同信息（分页）
     * @param page
     * @return
     */
    List<AgreementInfoDto> queryAgreementInfoByPage(Page<AgreementInfoDto> page);

    /**
     * 根据条件查询合同信息总数
     * @param page
     * @return
     */
    int queryAgreementInfoByPageCount(Page<AgreementInfoDto> page);

    /**
     * 根据条件查询合同信息（用于导出）
     * @param map
     * @return
     */
    List<AgreementInfoDto> selectAgreementInfoByMap(Map<String, Object> map);
}
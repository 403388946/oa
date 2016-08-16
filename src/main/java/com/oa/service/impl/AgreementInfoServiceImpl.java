package com.oa.service.impl;

import com.oa.dto.AgreementInfoDto;
import com.oa.mapper.AgreementInfoMapper;
import com.oa.model.AgreementInfo;
import com.oa.service.AgreementInfoService;
import com.oa.utils.ExcelData;
import com.oa.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 46637 on 2016/8/14.
 */
@Service(value = "agreementInfoService")
public class AgreementInfoServiceImpl implements AgreementInfoService {

    @Autowired
    private AgreementInfoMapper agreementInfoMapper;

    /**
     * 删除
     * @param agreementInfo
     * @return
     */
    @Override
    public int delete(AgreementInfo agreementInfo) {
        agreementInfo.setIsDel(1);
        return agreementInfoMapper.updateByPrimaryKeySelective(agreementInfo);
    }

    /**
     * 新增
     * @param agreementInfo
     * @return
     */
    @Override
    public int insert(AgreementInfo agreementInfo) {
        return agreementInfoMapper.insert(agreementInfo);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Override
    public AgreementInfoDto selectByPrimaryKey(Long id) {
        return agreementInfoMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据条件修改
     * @param agreementInfo
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(AgreementInfo agreementInfo) {
        return agreementInfoMapper.updateByPrimaryKeySelective(agreementInfo);
    }

    /**
     * 分页查询合同信息
     * @param page
     * @return
     */
    @Override
    public Page<AgreementInfoDto> queryAgreementInfoByPage(Page<AgreementInfoDto> page) {
        List<AgreementInfoDto> list = agreementInfoMapper.queryAgreementInfoByPage(page);
        if(list != null && list.size() > 0){
            int total = agreementInfoMapper.queryAgreementInfoByPageCount(page);
            page.setTotal(total);
        }else{
            page.setTotal(0);
        }
        page.setRows(list);
        return page;
    }

    /**
     * 根据条件查询合同信息
     * @param map
     * @return
     */
    @Override
    public List<AgreementInfoDto> selectAgreementInfoByMap(Map<String, Object> map) {
        return agreementInfoMapper.selectAgreementInfoByMap(map);
    }


    public void export(List<AgreementInfoDto> agreementInfoDtos, HttpServletRequest request, HttpServletResponse response) {
        //sheet
        List<List<String>> fileData = new ArrayList();
        //文件头-第一行
        List<String> fileHead = new ArrayList();
        fileHead.add("编号");
        fileHead.add("姓名");
        fileHead.add("身份证号码");
        fileHead.add("客户编号");
        fileHead.add("客户报价单号");
        fileHead.add("客户名称");
        fileHead.add("用工形式");
        fileHead.add("劳动合同起止时间");
        fileHead.add("试用期起止时间");
        fileHead.add("试用期工资");
        fileHead.add("正式工资");
        fileHead.add("劳动合同版本");
        fileHead.add("劳动合同期限");

        fileData.add(fileHead);
        //文件体-2~n行
        for(AgreementInfoDto agreementInfoDto : agreementInfoDtos){
            List<String> fileBody = new ArrayList();
            fileBody.add(agreementInfoDto.getEmployeeCode());
            fileBody.add(agreementInfoDto.getEmployeeName());
            fileBody.add(agreementInfoDto.getIdCard());
            fileBody.add(agreementInfoDto.getCustomerCode());
            fileBody.add(agreementInfoDto.getCustomerPriceNum());
            fileBody.add(agreementInfoDto.getCustomerName());
            fileBody.add(agreementInfoDto.getEmploymentForm() == 1 ? "代理" : agreementInfoDto.getEmploymentForm() == 2 ? "派遣" : "");
            if(StringUtils.isNotBlank(agreementInfoDto.getAgreementStartTimeStr()) && StringUtils.isNotBlank(agreementInfoDto.getAgreementEndTimeStr())){
                String agreementTime = agreementInfoDto.getAgreementStartTimeStr() + '~' + agreementInfoDto.getAgreementEndTimeStr();
                fileBody.add(agreementTime);
            }else{
                fileBody.add("");
            }
            if(StringUtils.isNotBlank(agreementInfoDto.getTestStartTimeStr()) && StringUtils.isNotBlank(agreementInfoDto.getTestEndTimeStr())){
                String testTime = agreementInfoDto.getTestStartTimeStr() + '~' + agreementInfoDto.getTestEndTimeStr();
                fileBody.add(testTime);
            }else{
                fileBody.add("");
            }
            fileBody.add(agreementInfoDto.getTestSalary().toString());
            fileBody.add(agreementInfoDto.getFormalSalary().toString());
            fileBody.add(agreementInfoDto.getAgreementVersion().toString());
            fileBody.add(agreementInfoDto.getTerm() == 0 ? "无固定期限" : agreementInfoDto.getTerm() + "年");
            fileData.add(fileBody);
        }
        //excel
        Map<String, List<List<String>>> fileMap = new HashMap();
        fileMap.put("合同信息", fileData);

        String filePath = request.getSession().getServletContext().getRealPath("/") + "assets" + "/excel" +  "合同信息" +".xls";
        String fileName = "合同信息";
        ExcelData.exportFile(fileMap, filePath, response, request, fileName);
    }
}

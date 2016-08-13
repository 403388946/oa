package com.oa.controller;

import com.oa.dto.AgreementDto;
import com.oa.model.Agreement;
import com.oa.service.AgreementService;
import com.oa.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 客户报价单号
 * Created by 46637 on 2016/8/11.
 */
@Controller
@RequestMapping(value = "agreement")
public class AgreementController {

    @Autowired
    private AgreementService agreementService;

    /**
     * 进入列表页
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "/agreement/agreementList";
    }

    /**
     * 进入选择客户单号列表页
     * @return
     */
    @RequestMapping(value = "selectAgreementList", method = RequestMethod.GET)
    public String selectAgreementList() {
        return "employee/selectAgreementList";
    }

    /**
     * 根据条件查询客户报价单号信息
     * @param offset
     * @param limit
     * @param customerName
     * @param customerCode
     * @param priceNum
     * @return
     */
    @RequestMapping(value = "getAgreementList")
    @ResponseBody
    public Page<AgreementDto> getAgreementList(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "customerName", defaultValue = "", required = false) String customerName,
            @RequestParam(value = "customerCode", defaultValue = "", required = false) String customerCode,
            @RequestParam(value = "priceNum", defaultValue = "", required = false) String priceNum) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("customerName", customerName);
        paramMap.put("customerCode", customerCode);
        paramMap.put("priceNum", priceNum);
        Page<AgreementDto> page = new Page<AgreementDto>();
        page.setOffset(offset);
        page.setLimit(limit);
        page.setParamMap(paramMap);
        page = agreementService.findAgreementByPage(page);
        return page;
    }

    /**
     * 根据条件查询客户报价单号信息(用于选择客户单号信息)
     * @param offset
     * @param limit
     * @param customerName
     * @param customerCode
     * @param priceNum
     * @return
     */
    @RequestMapping(value = "selectAgreementList")
    @ResponseBody
    public Page<AgreementDto> selectAgreementList(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit,
            @RequestParam(value = "customerName", defaultValue = "", required = false) String customerName,
            @RequestParam(value = "customerCode", defaultValue = "", required = false) String customerCode,
            @RequestParam(value = "priceNum", defaultValue = "", required = false) String priceNum) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("customerName", customerName);
        paramMap.put("customerCode", customerCode);
        paramMap.put("priceNum", priceNum);
        Page<AgreementDto> page = new Page<AgreementDto>();
        page.setOffset(offset);
        page.setLimit(limit);
        page.setParamMap(paramMap);
        page = agreementService.queryAgreementByMap(page);
        return page;
    }

    /**
     * 新增
     * @param agreement
     * @return
     */
    @RequestMapping(value = "saveAdd", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveAdd(Agreement agreement) {
        Map<String, Object> result = new HashMap<String, Object>();
        try{
            int num = agreementService.insert(agreement);
            result.put("status", num);
            result.put("msg", "添加成功");
        } catch (Exception e){
            result.put("status", 0);
            result.put("msg", "添加失败");
        }
        return result;
    }

    /**
     * 修改
     * @param agreement
     * @return
     */
    @RequestMapping(value = "saveUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveUpdate(Agreement agreement) {
        Map<String, Object> result = new HashMap<String, Object>();
        try{
            int num = agreementService.updateByPrimaryKeySelective(agreement);
            result.put("status", num);
            result.put("msg", "修改成功");
        } catch (Exception e){
            result.put("status", 0);
            result.put("msg", "修改失败");
        }
        return result;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam("id") Long id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try{
            Agreement agreement = new Agreement();
            agreement.setId(id);
            agreement.setIsDel(1);
            int num = agreementService.updateByPrimaryKeySelective(agreement);
            result.put("status", num);
            result.put("msg", "删除成功");
        } catch (Exception e){
            result.put("status", 0);
            result.put("msg", "删除失败");
        }
        return result;
    }
}

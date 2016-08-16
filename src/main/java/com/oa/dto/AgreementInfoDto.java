package com.oa.dto;

import com.oa.model.Agreement;
import com.oa.model.AgreementInfo;

import java.util.Date;

/**
 * 合同管理
 * Created by 46637 on 2016/8/14.
 */
public class AgreementInfoDto extends AgreementInfo {

    private String employeeCode;//编号
    private String employeeName;//姓名
    private String idCard;//身份证号码
    private String customerCode;//客户编号
    private String customerName;//客户名称
    private String customerPriceNum;//客户报价单号
    private Integer employmentForm;//用工形式 1代理 2派遣
    private String agreementStartTimeStr;//合同开始时间
    private String agreementEndTimeStr;//合同结束时间
    private String testStartTimeStr;//试用期开始时间
    private String testEndTimeStr; //试用期结束时间

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPriceNum() {
        return customerPriceNum;
    }

    public void setCustomerPriceNum(String customerPriceNum) {
        this.customerPriceNum = customerPriceNum;
    }

    public Integer getEmploymentForm() {
        return employmentForm;
    }

    public void setEmploymentForm(Integer employmentForm) {
        this.employmentForm = employmentForm;
    }

    public String getAgreementStartTimeStr() {
        return agreementStartTimeStr;
    }

    public void setAgreementStartTimeStr(String agreementStartTimeStr) {
        this.agreementStartTimeStr = agreementStartTimeStr;
    }

    public String getAgreementEndTimeStr() {
        return agreementEndTimeStr;
    }

    public void setAgreementEndTimeStr(String agreementEndTimeStr) {
        this.agreementEndTimeStr = agreementEndTimeStr;
    }

    public String getTestStartTimeStr() {
        return testStartTimeStr;
    }

    public void setTestStartTimeStr(String testStartTimeStr) {
        this.testStartTimeStr = testStartTimeStr;
    }

    public String getTestEndTimeStr() {
        return testEndTimeStr;
    }

    public void setTestEndTimeStr(String testEndTimeStr) {
        this.testEndTimeStr = testEndTimeStr;
    }
}

package com.oa.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 合同管理
 */
public class AgreementInfo implements Serializable{
    private static final long serialVersionUID = -517021804956919397L;
    private Long id;

    //员工id
    private Long employeeId;
    //合同开始时间
    private Date agreementStartTime;
    //合同结束时间
    private Date agreementEndTime;
    //试用期开始时间
    private Date testStartTime;
    //试用期结束时间
    private Date testEndTime;
    //试用期工资
    private BigDecimal testSalary;
    //正式工资
    private BigDecimal formalSalary;
    //合同版本
    private String agreementVersion;
    //合同期限
    private Integer term;
    private Integer isDel;//删除状态 0 未删除 1 已删除
    private Long creater;//创建人
    private Date createTime;//创建时间
    private Long updater;//修改人
    private Date updateTime;//修改时间

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Date getAgreementStartTime() {
        return agreementStartTime;
    }

    public void setAgreementStartTime(Date agreementStartTime) {
        this.agreementStartTime = agreementStartTime;
    }

    public Date getAgreementEndTime() {
        return agreementEndTime;
    }

    public void setAgreementEndTime(Date agreementEndTime) {
        this.agreementEndTime = agreementEndTime;
    }

    public Date getTestStartTime() {
        return testStartTime;
    }

    public void setTestStartTime(Date testStartTime) {
        this.testStartTime = testStartTime;
    }

    public Date getTestEndTime() {
        return testEndTime;
    }

    public void setTestEndTime(Date testEndTime) {
        this.testEndTime = testEndTime;
    }

    public BigDecimal getTestSalary() {
        return testSalary;
    }

    public void setTestSalary(BigDecimal testSalary) {
        this.testSalary = testSalary;
    }

    public BigDecimal getFormalSalary() {
        return formalSalary;
    }

    public void setFormalSalary(BigDecimal formalSalary) {
        this.formalSalary = formalSalary;
    }

    public String getAgreementVersion() {
        return agreementVersion;
    }

    public void setAgreementVersion(String agreementVersion) {
        this.agreementVersion = agreementVersion == null ? null : agreementVersion.trim();
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Long getCreater() {
        return creater;
    }

    public void setCreater(Long creater) {
        this.creater = creater;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getUpdater() {
        return updater;
    }

    public void setUpdater(Long updater) {
        this.updater = updater;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
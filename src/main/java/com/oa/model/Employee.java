package com.oa.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 员工
 * @author YiMing on 2016/7/25.
 */
public class Employee {
    private Long id;
    private String code;//编号
    private String name;//姓名
    private String idCard;//身份证号码
    private String orderCode;//单号
    private String customCode;//客户编号
    private String customName;//客户名称
    private String customPriceNum;//客户报价
    private String payCode;//工资卡号
    private Integer serviceStatus;//在职状态 0离职 1在职 2离职申请中
    private Integer employmentForm;//用工形式 1代理 2派遣
    private Date jionDate;//入职日期
    private Integer isDel;//删除状态 0 未删除 1 已删除
    private Long creater;//创建人
    private Date createDate;//创建时间
    private Long updater;//修改人
    private Date updateDate;//修改时间

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getCustomCode() {
        return customCode;
    }

    public void setCustomCode(String customCode) {
        this.customCode = customCode;
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName;
    }

    public String getCustomPriceNum() {
        return customPriceNum;
    }

    public void setCustomPriceNum(String customPriceNum) {
        this.customPriceNum = customPriceNum;
    }

    public String getPayCode() {
        return payCode;
    }

    public void setPayCode(String payCode) {
        this.payCode = payCode;
    }

    public Integer getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(Integer serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    public Integer getEmploymentForm() {
        return employmentForm;
    }

    public void setEmploymentForm(Integer employmentForm) {
        this.employmentForm = employmentForm;
    }

    public Date getJionDate() {
        return jionDate;
    }

    public void setJionDate(Date jionDate) {
        this.jionDate = jionDate;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Long getUpdater() {
        return updater;
    }

    public void setUpdater(Long updater) {
        this.updater = updater;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}

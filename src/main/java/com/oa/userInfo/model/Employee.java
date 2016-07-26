package com.oa.userInfo.model;

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
    private BigDecimal customPrice;//客户报价
    private String payCode;//工资卡号
    private Integer serviceStatus;//在职状态 0离职 1在职 2离职申请中
    private Integer employmentForm;//用工形式 1代理 2派遣
    private Date jionDate;//入职日期
    private Integer isDel;//删除状态 0 未删除 1 已删除
    private Long creater;//创建人
    private Date createDate;//创建时间
    private Long updater;//修改人
    private Date updateDate;//修改时间

}

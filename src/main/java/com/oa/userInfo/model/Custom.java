package com.oa.userInfo.model;

import java.util.Date;

/**
 * 客户信息
 * @author YiMing on 2016/7/25.
 */
public class Custom {

    private Long id;
    private String name;//公司名称
    private String code;//公司编号
    private Integer isDel;//删除状态 0 未删除 1 已删除
    private Long creater;//创建人
    private Date createDate;//创建时间
    private Long updater;//修改人
    private Date updateDate;//修改时间
}

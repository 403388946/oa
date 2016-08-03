package com.oa.dto;

import java.util.Date;

/**
 * 客户信息
 * @author YiMing on 2016/7/25.
 */
public class CustomDto {

    private Long id;
    private String name;//公司名称
    private String code;//公司编号
    private Integer isDel;//删除状态 0 未删除 1 已删除
    private Long creater;//创建人
    private Date createDate;//创建时间
    private Long updater;//修改人
    private Date updateDate;//修改时间

    private Integer currentPage = 1;
    private Integer startItem = 0;
    private Integer pageSize = 10;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getStartItem() {
        return startItem;
    }

    public void setStartItem(Integer startItem) {
        this.startItem = startItem;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}

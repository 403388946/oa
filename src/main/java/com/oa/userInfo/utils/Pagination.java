package com.oa.userInfo.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 46637 on 2016/7/25.
 */
public class Pagination<T> implements Serializable {

    private static final long serialVersionUID = -3668148673918896549L;
    private Integer total = 0;

    private List<T> rows = new ArrayList<T>();

    /**
     * 每页数量
     */
    private Integer pageSize = 10;
    /**
     * 页数
     */
    private Integer pageNum =0;
    /**
     * 当前页
     */
    private Integer currentPage = 1;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return total%pageSize==0?total/pageSize:(total/pageSize+1);
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
}

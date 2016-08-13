package com.oa.dto;

import com.oa.model.Agreement;

/**
 * Created by 46637 on 2016/8/11.
 */
public class AgreementDto extends Agreement {

    //客户名称
    private String customerName;
    //客户编号
    private String customerCode;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }
}

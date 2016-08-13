<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/8/11
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <script src="${ctx}/static/js/employee/selectAgreementList.js"></script>
</head>
<div id="agreement-toolbar">
    <div class="form-inline" role="form" id="search_div_agreement">
        <div class="form-group">
            <input type="text" class="form-control" id="priceNum" name="priceNum" placeholder="请输入报价单号" />
        </div>
        <div class="form-group">
            <input type="text" name="customerName" id="customerName" class="form-control" placeholder="请输入客户名称" />
        </div>
        <div class="form-group">
            <input type="text" id="customerCode" name="customerCode" class="form-control" placeholder="输入客户编号" />
        </div>
        <button type="button" id="agreenment_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="agreenment_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>
    </div>
</div>
<table id="agreement_table" class="table table-bordered">
</table>

<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/8/15
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script src="${ctx}/static/js/agreementInfo/employeeList.js"></script>

<div id="employee-toolbar2">
    <div class="form-inline" role="form" id="employee_search_div2">
        <div class="form-group">
            <input type="text" class="form-control" id="employeeCode" name="employeeCode" placeholder="请输入员工编号" />
        </div>
        <div class="form-group">
            <input type="text" name="employeeName" id="employeeName" class="form-control" placeholder="请输入员工名称" />
        </div>
        <div class="form-group">
            <input type="text" id="customerName" name="customerName" class="form-control" placeholder="输入客户名称" />
        </div>
        <button type="button" id="employee_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="employee_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>

    </div>
</div>
<table id="employee_table"></table>

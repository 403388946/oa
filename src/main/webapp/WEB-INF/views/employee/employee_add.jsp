<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/7/26
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <script src="${ctx}/static/js/bootstrap-datepicker/css/datepicker.css"></script>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/js/bootstrap.js"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${ctx}/static/js/moment.min.js"></script>
    <script src="${ctx}/static/js/daterangepicker.js"></script>
    <script type="text/javascript" >
$(function(){
    $('#jionDate_datetimepicker').datepicker({
        format: 'yyyy-mm-dd'
    });
});
    </script>
</head>
<body >
<div id="theme-wrapper">
    <!--头开始-->
    <jsp:include page="/common/header.jsp"/>
    <!--头结束-->
    <div id="page-wrapper" class="container">
        <div class="row">
            <!--左边导航开始-->
            <jsp:include page="/common/left.jsp"/>
            <!--左边导航结束-->
            <div id="content-wrapper" class="email-inbox-wrapper">
                <div class="row" style="opacity: 1;">
                    <div class="col-lg-12">
                        <!--正文开始-->
                            <form action="${ctx}/employee/save">
                                <div class="main-box">
                                    <header class="main-box-header clearfix">
                                        <h2>新增员工信息</h2>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <form role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="code">员工编号：</label>
                                                <div class="col-lg-11">
                                                    <input type="text" placeholder="请输入员工编号" id="code" name="code" class="form-control" value="${employee.code}">
                                                    <input type="hidden" id="id" name="id" class="form-control" value="${employee.id}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="name">员工姓名：</label>
                                                <div class="col-lg-11">
                                                    <input type="text" placeholder="请输入员工姓名" id="name" name="name" class="form-control" value="${employee.name}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="name">身份证号：</label>
                                                <div class="col-lg-11">
                                                    <input type="text" placeholder="请输入身份证号" id="idCard" name="idCard" class="form-control" value="${employee.idCard}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="name">选择客户：</label>
                                                <div class="col-lg-11">
                                                    <input type="button" value="选择客户" id="selectCustom"  class="btn">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="name"></label>
                                                <div class="col-lg-11">
                                                    客户编号：<span id="custom-code">${employee.customCode}</span>
                                                    客户报价单号：<span id="custom-price-num">${employee.customPriceNum}</span>
                                                    客户姓名：<span id="custom-name">${employee.customName}</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="jionDate">入职日期：</label>
                                                <div class="col-lg-11 input-group date"  id="jionDate_datetimepicker" data-date-format="yyyy-mm-dd">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                    <input type="text" placeholder="请选择入职日期" id="jionDate" name="jionDate" class="form-control" value="${employee.jionDate}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="payCode">工资卡号：</label>
                                                <div class="col-lg-11">
                                                    <input type="text" placeholder="请选择工资卡号" id="payCode" name="payCode" class="form-control" value="${employee.payCode}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="serviceStatus">在职状态：</label>
                                                <div class="col-lg-11">
                                                    <select id="serviceStatus" name="serviceStatus">
                                                        <option value="">--请选择--</option>
                                                        <option value="0" <c:if test="${employee.serviceStatus == 0}">selected</c:if>>离职</option>
                                                        <option value="1" <c:if test="${employee.serviceStatus == 1}">selected</c:if>>在职</option>
                                                        <option value="2" <c:if test="${employee.serviceStatus == 2}">selected</c:if>>离职申请中</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="payCode">用工形式：</label>
                                                <div class="col-lg-11">
                                                    <select id="employmentForm" name="employmentForm">
                                                        <option value="">--请选择--</option>
                                                        <option value="1" <c:if test="${employee.employmentForm == 1}">selected</c:if>>代理</option>
                                                        <option value="2" <c:if test="${employee.employmentForm == 2}">selected</c:if>>派遣</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-offset-2 col-lg-10">
                                                    <button class="btn btn-success" type="submit">保存</button>
                                                    <button class="btn btn-cancel" type="reset">取消</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </form>
                        <!--正文结束-->
                    </div>
                </div>
                <!--结尾开始-->
                <jsp:include page="/common/footer.jsp"/>
                <!--结尾结束-->
            </div>
        </div>
    </div>
</div>
</body>
</html>
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
<script src="${ctx}/static/js/employee/employeeAdd.js"></script>

<script type="text/javascript" >
    var ctx_ = "${ctx}";
</script>
<div class="main-box">
    <header class="main-box-header clearfix">
        <h2>新增员工信息</h2>
    </header>
    <div class="main-box-body clearfix">
        <form action="${ctx}/employee/save" id="editFoem" role="form" class="form-horizontal">
            <div class="form-group">
                <label class="col-lg-1 control-label" for="code">员工编号：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="请输入员工编号" id="code" name="code" class="form-control" value="${employee.code}">
                    <input type="hidden" id="id" name="id" class="form-control" value="${employee.id}">
                </div>
            </div>
            <br>

            <div class="form-group">
                <label class="col-lg-1 control-label" for="name">员工姓名：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="请输入员工姓名" id="name" name="name" class="form-control" value="${employee.name}">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="idCard">身份证号：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="请输入身份证号" id="idCard" name="idCard" class="form-control" value="${employee.idCard}">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="selectCustom">选择客户：</label>
                <div class="col-lg-11">
                    <input type="button" value="选择客户" id="selectCustom"  class="btn btn-default" data-toggle="modal" data-target="#customer-modal" name="customer" placeholder="请选择客户" readonly="readonly">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="name">客户编号：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="客户编号" id="customCode" name="customCode" class="form-control" value="${employee.customCode}" readonly="readonly">
                </div>
            </div><br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="customName">客户姓名：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="客户姓名" id="customName" name="customName" class="form-control" value="${employee.customName}" readonly="readonly">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="customPriceNum">客户报价单号：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="请输入客户报价单号" id="customPriceNum" name="customPriceNum" class="form-control" value="${employee.customPriceNum}">
                </div>
            </div><br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="jionDate">入职日期：</label>
                <div class="col-lg-11 input-group">
                    <%--<span class="input-group-addon datetimepicker" id="jionDate_datetimepicker">--%>
                    <%--<i class="fa fa-calendar"></i>--%>
                    <%--</span>--%>
                    <input type="text" placeholder="请选择入职日期" id="jionDate" name="jionDate" class="form-control datetimepicker" value="${employee.jionDate}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="payCode">工资卡号：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="请输入工资卡号" id="payCode" name="payCode" class="form-control" value="${employee.payCode}">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="serviceStatus">在职状态：</label>
                <div class="col-lg-11">
                    <select id="serviceStatus" name="serviceStatus" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="0" <c:if test="${employee.serviceStatus == 0}">selected</c:if>>离职</option>
                        <option value="1" <c:if test="${employee.serviceStatus == 1}">selected</c:if>>在职</option>
                        <option value="2" <c:if test="${employee.serviceStatus == 2}">selected</c:if>>离职申请中</option>
                    </select>
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="employmentForm">用工形式：</label>
                <div class="col-lg-11">
                    <select id="employmentForm" name="employmentForm" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="1" <c:if test="${employee.employmentForm == 1}">selected</c:if>>代理</option>
                        <option value="2" <c:if test="${employee.employmentForm == 2}">selected</c:if>>派遣</option>
                    </select>
                </div>
            </div>
            <br>
            <div class="modal-footer" style="text-align: left;">
                <button class="btn btn-success" type="submit">保存</button>
                <button class="btn btn-cancel" type="reset">取消</button>
            </div>
        </form>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="customer-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">选择会员</h4>
            </div>
            <div id="customer_div" class="modal-body" >
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="customer-select" >确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/8/15
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<script src="${ctx}/static/js/agreementInfo/agreementInfoList.js"></script>
<div id="agreementInfo_toolbar">
    <div class="form-inline" role="form" id="agreementInfo_serch_div">
        <div class="form-group">
            员工名称: <input type="text" name="employeeName" id="employeeName" class="form-control" placeholder="请输入员工名称" style="width:120px;"/>
        </div>
        <div class="form-group">
            客户名称：<input type="text" id="customerName" name="customerName" class="form-control" placeholder="输入客户名称" style="width:120px;"/>
        </div>
        <div class="form-group">
            合同版本：<input type="text" class="form-control" id="version" name="version" placeholder="请输入合同版本" style="width:120px;"/>
        </div>
        <div class="form-group">
            合同起始日期： <input type="text" placeholder="请选择合同开始日期" id="agreementStartTimeStr" name="agreementStartTimeStr" class="form-control datetimepicker" value="${agreementInfo.agreementStartTime}" readonly="readonly" style="background:white;">
            ~
            <input type="text" placeholder="请选择合同结束日期" id="agreementEndTimeStr" name="agreementEndTimeStr" class="form-control datetimepicker" value="${agreementInfo.agreementEndTime}" readonly="readonly" style="background:white;">
        </div>
        <button type="button" id="agreementInfo_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="agreementInfo_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>
        <a href="javascript:void(0);" id="agreementInfo_export" class="btn btn-default">导出</a>
    </div>
</div>
<tags:table id="agreementInfo_table"/>
<tags:upload id="agreementInfo"
             uploadAction="${ctx}/sys/upload"
             serviceType="1"
             downloadAction="${ctx}/sys/down"
             saveAction="${ctx}/sys/save"
             deleteAction="${ctx}/sys/delete"
             dateAction="${ctx}/sys/findFiles" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/bootstrap.js"></script>
<script src="${ctx}/static/js/bootstrap-table.js"></script>
<script src="${ctx}/static/js/bootstrap-table-zh-CN.js"></script>--%>
<script src="${ctx}/static/js/employee/customerList.js"></script>
<script type="text/javascript">
    var ctx_ = "${ctx}";
</script>

<div id="custom-toolbar2">
    <div class="form-inline" role="form" id="customer_search_div2">
        <div class="form-group">
            <input type="text" id="cusCode" name="cusName" class="form-control" placeholder="请输入编号">
        </div>
        <div class="form-group">
            <input type="text" id="cusName" name="cusName" class="form-control" placeholder="请输入名称">
        </div>
        <button type="button" id="g_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="g_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>

    </div>
    <table id="customer_table"></table>
</div>
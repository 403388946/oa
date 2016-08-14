<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    <script type="text/javascript" src="${ctx}/static/js/custom/customList.js"></script>

    <div id="custom-toolbar">
        <div class="form-inline" role="form" id="serch_div">
            <div class="form-group">
                编号：<input type="text" class="form-control" id="code_" name="code" placeholder="请输入客户编号" />
            </div>
            <div class="form-group">
                姓名：<input type="text" class="form-control" id="name_" name="name" placeholder="请输入客户名称" />
            </div>
            <button type="button" id="g_search" class="btn btn-primary">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                查询
            </button>
            <button type="button" id="g_reset" class="btn btn-primary">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                清空查询
            </button>
        </div>
    </div>
    <tags:table id="customs"/>


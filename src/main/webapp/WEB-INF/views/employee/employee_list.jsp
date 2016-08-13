<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <script src="${ctx}/static/js/employee/employeeList.js"></script>
</head>
<body>
        <div id="employee-toolbar">
            <div class="form-inline" role="form" id="serch_div">
                <div class="form-group">
                    编号：<input type="text" class="form-control" id="code" name="code" placeholder="请输入员工编号" />
                </div>
                <div class="form-group">
                    姓名：<input type="text" name="name" id="name" class="form-control" placeholder="请输入员工名称" />
                </div>
                <div class="form-group">
                    身份证号码:<input type="text" id="idCard" name="idCard" class="form-control" placeholder="输入身份证号码" />
                </div>
                <div class="form-group">
                    客户名称:<input type="text" id="customName" name="customName" class="form-control" placeholder="输入客户名称" />
                </div>
                <button type="button" id="g_search" class="btn btn-default ">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    查询
                </button>
                <button type="button" id="g_reset" class="btn btn-default ">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    清空查询
                </button>
                <a href="${ctx}/employee/exportExcel" id="g_import" class="btn btn-default">导出</a>
            </div>
        </div>
        <table id="employeeList" class="table table-bordered">
        </table>
</body>
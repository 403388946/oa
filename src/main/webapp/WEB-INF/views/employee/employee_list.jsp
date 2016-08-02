<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/7/26
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">
        .search-table{
            width: 100%;
            line-height:30px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/js/bootstrap.js"></script>
    <script src="${ctx}/static/js/bootstrap-table.js"></script>
    <script src="${ctx}/static/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/employee/employeeList.js"></script>
    <script type="text/javascript" >
     var ctx_ = "${ctx}";
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
                    <!--正文开始-->
                    <div class="col-lg-12 ">
                        <div id="custom-toolbar">
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
                    </div>
                    <div class="col-lg-12">
                        <table id="employeeList" class="table table-bordered">
                        </table>
                    </div>
                    <!--正文结束-->
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

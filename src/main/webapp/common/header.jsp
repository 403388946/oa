<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>--%>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>--%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/nanoscroller.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
<link rel="stylesheet" href="${ctx}/static/css/libs/fullcalendar.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/static/css/compiled/calendar.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="${ctx}/static/css/libs/morris.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/static/css/libs/daterangepicker.css" type="text/css"/>
<link type="image/x-icon" href="favicon.png" rel="shortcut icon"/>
<script src="${ctx}/static/js/demo-rtl.js"></script>

<style>

</style>
<header class="navbar" id="header-navbar">
    <div class="container">
        <a href="index.html" id="logo" class="navbar-brand">
            <img src="${ctx}/static/img/logo.png" alt="" class="normal-logo logo-white"/>
            <img src="${ctx}/static/img/logo-black.png" alt="" class="normal-logo logo-black"/>
            <img src="${ctx}/static/img/logo-small.png" alt="" class="small-logo hidden-xs hidden-sm hidden"/>
        </a>
        <div class="clearfix">
            <div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
                <ul class="nav navbar-nav pull-left">
                    <li>
                        <a class="btn" id="make-small-nav">
                            <i class="fa fa-bars"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="nav-no-collapse pull-right" id="header-nav">
                <ul class="nav navbar-nav pull-right">
                    <li class="hidden-xxs">
                        <a class="btn">
                            <i class="fa fa-power-off"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
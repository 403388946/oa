<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>--%>
<%--<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>--%>
<div id="nav-col">
    <section id="col-left" class="col-left-nano">
        <div id="col-left-inner" class="col-left-nano-content">
            <div class="clearfix hidden-sm hidden-xs" id="user-left-box">
                <img src="${ctx}/static/img/scarlet-159.png" alt="">
                <div class="user-box">
                    <span class="name">欢迎登录, 123</span>
                </div>
            </div>
            <div id="sidebar-nav" class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav nav-pills nav-stacked">
                    <!--右边导航-->
                    <li>
                        <a href="index.html">
                            <i class="fa fa-dashboard"></i>
                            <span>员工管理</span>
                            <span class="label label-info label-circle pull-right">28</span>
                        </a>
                    </li>
                    <li class="">
                        <a class="dropdown-toggle" href="#">
                            <i class="fa fa-table"></i>
                            <span>客户管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                        <ul class="submenu" style="display: none;">
                            <li>
                                <a href="tables.html">
                                    Simple
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</div>

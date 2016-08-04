<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    $(function() {
        $('.menu_click').on('click', function() {
            $('#main_view').load($(this).attr('data-href'));
        });
    })
</script>
<div id="nav-col">
    <section id="col-left" class="col-left-nano">
        <div id="col-left-inner" class="col-left-nano-content">
            <div class="clearfix hidden-sm hidden-xs" id="user-left-box">
                <%--<img src="${ctx}/static/img/scarlet-159.png" alt="">--%>
                <div class="user-box">
                    <span class="name">欢迎登录,<shiro:principal/></span>
                </div>
            </div>
            <div id="sidebar-nav" class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav nav-pills nav-stacked">
                    <!--右边导航-->
                    <li class="">
                        <a href="#employeeManager" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-user"></i>
                            <span>员工管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                            <%--<span class="label label-info label-circle pull-right">28</span>--%>
                        </a>
                        <ul id="employeeManager" class="submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/employee/list" class="menu_click">
                                    全部员工
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a class="dropdown-toggle menu_click" href="javascript:void(0);">
                            <i class="fa fa-table"></i>
                            <span>客户管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                        <ul class="submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/custom/findPage" class="menu_click">
                                    全部客户
                                </a>
                                <a href="javascript:void(0);" data-href="${ctx}/custom/addCustom" class="menu_click">
                                    添加客户
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</div>

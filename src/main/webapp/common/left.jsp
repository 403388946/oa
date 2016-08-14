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
                        <a class="dropdown-toggle" href="#resource_1">
                            <span>客户管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                        <ul id="resource_1" class="submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/custom/findPage" class="menu_click">
                                    客户列表
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/custom/add" class="menu_click">添加客户</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#resource_2" class="dropdown-toggle">
                            <span>员工管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                        <ul id="resource_2" class="submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/employee/list" class="menu_click">
                                    员工列表
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/employee/add" class="menu_click">
                                    新增员工
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#resource_3" class="dropdown-toggle">
                            <span>报价单号管理</span>
                            <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                        <ul id="resource_3" class="submenu" style="display: none;">
                            <li>
                                <a href="javascript:void(0);" data-href="${ctx}/agreement/list" class="menu_click">
                                    员工列表
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</div>

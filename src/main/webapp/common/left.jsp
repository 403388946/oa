<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    $(function() {
        $('.menu_click').on('click', function() {
            var href = $(this).attr('data-href');
            $('#main_view').load(href);
        });
    });
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
                    <c:forEach items="${menus}" var="menu">
                        <c:set var="flag" value="${fn:length(menu.children) > 0}" />
                        <li>
                            <a class="dropdown-toggle menu_click"  href="javascript:void(0);" <c:if test="${!flag}">data-href="${ctx}${menu.url}"</c:if> >
                                <span>${menu.name}</span>
                                <c:if test="${flag}">
                                <i class="fa fa-chevron-circle-right drop-icon"></i>
                                </c:if>
                            </a>
                            <c:if test="${flag}">
                            <ul class="submenu" style="display: none;">
                                <c:forEach items="${menu.children}" var="child">
                                <li>
                                    <a href="javascript:void(0);" data-href="${ctx}${child.url}" class="menu_click">
                                        ${child.name}
                                    </a>
                                </li>
                                </c:forEach>
                            </ul>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>
</div>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<header class="navbar" id="header-navbar">
    <div class="container">
        <a href="${ctx}/index" id="logo" class="navbar-brand">
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
                    <li class="dropdown hidden-xs">
                        <a class="btn dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="count">${fn:length(messages)}</span>
                        </a>
                        <c:if test="${fn:length(messages) > 0}">
                            <ul class="dropdown-menu notifications-list">
                                <li class="pointer">
                                    <div class="pointer-inner">
                                        <div class="arrow"></div>
                                    </div>
                                </li>
                                <li class="item-header">你有${fn:length(messages)}条新通知</li>
                                <c:forEach items="${messages}" var="message">
                                    <li class="item">
                                        <a href="${not empty message.url ? 'javascript:view(${message.id}})' : 'javascript:view(${message.id}})'}">
                                            <i class="fa fa-envelope"></i>
                                            <span class="content">
                                                    ${message.content}
                                            </span>
                                                <%--<span class="time">--%>
                                                <%--<i class="fa fa-clock-o"></i>--%>
                                                <%--13 min.--%>
                                                <%--</span>--%>
                                        </a>
                                    </li>
                                </c:forEach>

                                <%--<li class="item-footer">
                                    <a href="#">
                                        View all notifications
                                    </a>
                                </li>--%>
                            </ul>
                        </c:if>
                    </li>
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
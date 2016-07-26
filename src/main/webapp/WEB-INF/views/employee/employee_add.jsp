<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/7/26
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">

    </style>
    <script type="text/javascript" >

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
                    <div class="col-lg-12">
                        <!--正文开始-->
                        <!--正文结束-->
                    </div>
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
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/nanoscroller.css"/>
    <link  rel="stylesheet" src="${ctx}/static/js/bootstrap-datepicker/css/datepicker.css"/>
    <link href="${ctx}/static/css/jquery.scrollToTop.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/libs/fullcalendar.css" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/static/css/compiled/calendar.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="${ctx}/static/css/libs/morris.css" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/static/css/libs/daterangepicker.css" type="text/css"/>
    <link href="${ctx}/static/js/bootstrapvalidator/css/bootstrapValidator.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/js/bootstrap.js"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${ctx}/static/js/moment.min.js"></script>
    <script src="${ctx}/static/js/daterangepicker.js"></script>
    <link type="image/x-icon" href="favicon.png" rel="shortcut icon"/>
    <script src="${ctx}/static/js/demo-rtl.js"></script>
    <script src="${ctx}/static/js/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.scrollToTop.js" type="text/javascript"></script>
    <style>

    </style>
    <script type="text/javascript" >
        var _ctx = "${ctx}";
        jQuery(function() {
            jQuery(window).scrollToTop();
        });
    </script>
    <sitemesh:write property='head' />
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
                        <div class="col-lg-12" id="main_view">
                            <!--正文开始-->
                            <!--正文结束-->
                            <sitemesh:write property='body' />

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
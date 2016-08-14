<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><sitemesh:write property='title'/></title>
    <style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/nanoscroller.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.scrollToTop.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/fullcalendar.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/calendar.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/morris.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/bootstrapvalidator/css/bootstrapValidator.min.css"/>

    <script src="${ctx}/static/js/jquery.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/moment.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.scrollToTop.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-table.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-table-zh-CN.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/scripts.js" type="text/javascript"></script>

    <script src="${ctx}/static/js/jquery.nanoscroller.min.js"></script>
    <%--<script src="${ctx}/static/js/jquery-ui.custom.min.js"></script>--%>
    <script src="${ctx}/static/js/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/static/js/morris.min.js"></script>
    <script src="${ctx}/static/js/moment.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.pie.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.stack.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.resize.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.time.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.threshold.js"></script>
    <script type="text/javascript" >
        var _ctx = "${ctx}";
        jQuery(function() {
            jQuery(window).scrollToTop();
        });
    </script>
    <sitemesh:write property='head' />
</head>
<body class="pace-done fixed-header fixed-leftmenu fixed-footer theme-blue">
    <div id="theme-wrapper">
        <!--头开始-->
        <jsp:include page="/common/header.jsp"/>
        <!--头结束-->
        <div id="page-wrapper" class="container">
            <div class="row">
                <!--左边导航开始-->
                <jsp:include page="/common/left.jsp"/>
                <!--左边导航结束-->
                <div id="content-wrapper">
                    <div class="row">
                        <div class="col-xs-12" id="main_view">
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
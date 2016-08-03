<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>OA</title>
    <link rel="stylesheet" href="${ctx}/static/css/layout-default-latest.css">
</head>
<body>

<iframe name="content" class="ui-layout-center"
        src="${ctx}/welcome" frameborder="0" scrolling="auto"></iframe>
<div class="ui-layout-north">欢迎[<shiro:principal/>]，<a href="${ctx}/logout">退出</a></div>
<div class="ui-layout-west">
    功能菜单<br/>
    <c:forEach items="${menus}" var="m">
        <a href="${ctx}/${m.url}" target="content">${m.name}</a><br/>
    </c:forEach>
</div>


<script src="${ctx}/static/js/jquery-1.11.0.min.js"></script>
<script src="${ctx}/static/js/jquery.layout-latest.min.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            $('body').layout({ applyDemoStyles: true });
        });
    });
</script>
</body>
</html>

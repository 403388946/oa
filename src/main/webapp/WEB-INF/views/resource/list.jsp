<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${ctx}/static/css/css.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/jquery-treetable/stylesheets/jquery.treetable.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/jquery-treetable/stylesheets/jquery.treetable.theme.default.css">
</head>
<body>

<c:if test="${not empty msg}">
    <div class="message">${msg}</div>
</c:if>

<table id="table" class="table">
    <thead>
        <tr>
            <th>名称</th>
            <th>类型</th>
            <th>URL路径</th>
            <th>权限字符串</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${resourceList}" var="resource">
            <tr data-tt-id='${resource.id}' <c:if test="${not resource.rootNode}">data-tt-parent-id='${resource.parentId}'</c:if>>
                <td>${resource.name}</td>
                <td>${resource.type.info}</td>
                <td>${resource.url}</td>
                <td>${resource.permission}</td>
                <td>
                    <shiro:hasPermission name="resource:create">
                        <c:if test="${resource.type ne 'button'}">
                        <a class="table-click" href="javascript:void(0)" data-href="${ctx}/resource/${resource.id}/appendChild">添加子节点</a>
                        </c:if>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="resource:update">
                        <a class="table-click" href="javascript:void(0)" data-href="${ctx}/resource/${resource.id}/edit">修改</a>
                    </shiro:hasPermission>
                    <c:if test="${not resource.rootNode}">
                    <shiro:hasPermission name="resource:delete">
                        <a class="table-click" href="javascript:void(0)" data-type="delete" data-href="${ctx}/resource/${resource.id}/delete">删除</a>
                    </shiro:hasPermission>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script src="${ctx}/static/plugins/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
<script>
    $(function() {
        $("#table").treetable({ expandable: true }).treetable("expandNode", 1);
        $(".table-click").click(function() {
            if(confirm("确认吗?")) {
                var href = $(this).attr("data-href");
                var dataType = $(this).attr("data-type");
                if(!dataType) {
                    $("#main_view").load(href);
                } else {
                    $.get(href, function(result) {
                        if (result.status == 1) {
                            $('#main_view').load(_ctx + '/resource/index');
                        }
                        alert(result.message);
                    }, 'json');
                }

            }
        });
    });
</script>
</body>
</html>
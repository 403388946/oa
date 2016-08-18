<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="oaTags" uri="com.oa.lib.tags" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="table-responsive">
    <table data-toggle="table" class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${roleList}" var="role">
                <tr>
                    <td>${role.role}</td>
                    <td>${role.description}</td>
                    <td>
                        <shiro:hasPermission name="role:update">
                            <a class="table-click" href="javascript:void(0)" data-href="${ctx}/role/${role.id}/edit">修改</a>
                        </shiro:hasPermission>

                        <shiro:hasPermission name="role:delete">
                            <a class="table-click" href="javascript:void(0)" data-type="delete" data-href="${ctx}/role/${role.id}/delete">删除</a>
                        </shiro:hasPermission>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script>
    $(function() {
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
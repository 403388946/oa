<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="${ctx}/static/js/custom/customAdd.js"></script>

<div class="main-box">
    <header class="main-box-header clearfix">
        <h2>新增员工信息</h2>
    </header>
    <div class="main-box-body clearfix">
        <form action="${ctx}/custom/save" id="editForm" role="form" class="form-horizontal">
            <div class="form-group">
                <label class="col-lg-1 control-label" for="code">客户编号：</label>
                <div class="col-lg-11">
                    <input type="hidden" id="id" name="id" class="form-control" value="${custom.id}">
                    <input type="text" placeholder="请输入员工编号" id="code" name="code" class="form-control" value="${custom.code}">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-lg-1 control-label" for="name">客户姓名：</label>
                <div class="col-lg-11">
                    <input type="text" placeholder="客户姓名" id="name" name="name" class="form-control" value="${custom.name}">
                </div>
            </div>
            <br>
            <div class="modal-footer" style="text-align: left;">
                <button class="btn btn-success" type="submit">保存</button>
                <button class="btn btn-cancel" type="reset">取消</button>
            </div>
        </form>
    </div>
</div>



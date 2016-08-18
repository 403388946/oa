<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    $(function(){
        /** 新增 校验* */
        $('#resource_form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '资源名称不能为空'
                        }
                    }
                }
            },
            fields: {
                type: {
                    validators: {
                        notEmpty: {
                            message: '资源类型不能为空'
                        }
                    }
                }
            },
            fields: {
                permission: {
                    validators: {
                        notEmpty: {
                            message: '资源关键字不能为空'
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {
                $.post(form.attr('action'), form.serialize(), function(result) {
                    if (result.status == 1) {
                        $('#main_view').load(_ctx + '/resource/index');
                    }
                    alert(result.message);
                }, 'json');
            }
        });
        /** 新增 校验end* */
    });
</script>
<div class="col-lg-12">
    <div class="main-box">
        <header class="main-box-header clearfix">
            <c:if test="${not empty parent}">
                <h2>
                    父节点名称：${parent.name}
                </h2>
            </c:if>
        </header>
        <form:form method="post" id="resource_form" commandName="resource" action="${ctx}/resource/save">
            <form:hidden path="id"/>
            <form:hidden path="available"/>
            <form:hidden path="parentId"/>
            <form:hidden path="parentIds"/>

            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="name"><c:if test="${not empty parent}">子</c:if>名称：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="name"/>
                </div>
            </div>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="type">类型：</form:label>
                <div class="col-lg-10">
                    <form:select cssClass="form-control" path="type" items="${types}" itemLabel="info"/>
                </div>
            </div>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="url">URL路径：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="url"/>
                </div>
            </div>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="permission">权限字符串：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="permission"/>
                </div>
            </div>
            <div class="modal-footer" style="text-align: left;">
                <button class="btn btn-success" type="submit">保存</button>
                <button class="btn btn-cancel" type="reset">取消</button>
            </div>
        </form:form>
    </div>
</div>
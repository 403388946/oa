<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="oaTags" uri="com.oa.lib.tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    $(function(){
        /** 新增 校验* */
        $('#user_form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: '帐号不能为空'
                        },
                        callback: {
                            message: '抱歉，此身帐号已存在',
                            callback: function(value, validator,$field) {
                                var result = false;
                                $.ajax({
                                    url:_ctx +"/user/findUserName",
                                    type:'post',
                                    async:false,
                                    data:{
                                        userName : value
                                    },
                                    success:function(msg){
                                        if(msg.status==0){
                                            result = true;
                                        }else if (msg.status==1){
                                            result = false;
                                        }
                                    }
                                });
                                return result;
                            }
                        }
                    }
                }
            },
            fields: {
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {
                $.post(form.attr('action'), form.serialize(), function(result) {
                    if (result.status == 1) {
                        $('#main_view').load(_ctx + '/user/index');
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
            <h2>新增员工信息</h2>
        </header>
        <div class="main-box-body clearfix">
            <form:form method="post" id="user_form" commandName="user" action="${ctx}/user/save">
            <form:hidden path="id"/>
            <form:hidden path="salt"/>
            <form:hidden path="locked"/>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="username">帐号：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="username"/>
                </div>
            </div>
            <c:if test="${user.id == null}">
                <div class="form-group">
                    <form:label cssClass="col-lg-2 control-label" path="password">密码：</form:label>
                    <div class="col-lg-10">
                        <form:input cssClass="form-control" path="password"/>
                    </div>
                </div>
            </c:if>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="roleIds">角色：</form:label>
                <div class="col-lg-10">
                    <form:select path="roleIds" cssClass="form-control" items="${roleList}" itemLabel="description" itemValue="id" multiple="true"/>
                </div>
            </div>
            <div class="modal-footer" style="text-align: left;">
                <button class="btn btn-success" type="submit">保存</button>
                <button class="btn btn-cancel" type="reset">取消</button>
            </div>
        </form:form>
        </div>
    </div>
</div>
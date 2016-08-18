<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="oaTags" uri="com.oa.lib.tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/static/plugins/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css">
<style>
    ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #f0f6e4;width:220px;height:200px;overflow-y:scroll;overflow-x:auto;}
</style>
<script src="${ctx}/static/plugins/JQuery zTree v3.5.15/js/jquery.ztree.all-3.5.min.js"></script>
<script>
    $(function () {
        var setting = {
            check: {
                enable: true ,
                chkboxType: { "Y": "", "N": "" }
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck
            }
        };

        var zNodes =[
            <c:forEach items="${resourceList}" var="r">
            <c:if test="${not r.rootNode}">
            { id:${r.id}, pId:${r.parentId}, name:"${r.name}", checked:${oaTags:in(role.getResourceIdsList(), r.id)}},
            </c:if>
            </c:forEach>
        ];

        function onCheck(e, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("tree"),
                    nodes = zTree.getCheckedNodes(true),
                    id = "",
                    name = "";
            nodes.sort(function compare(a,b){return a.id-b.id;});
            for (var i=0, l=nodes.length; i<l; i++) {
                id += nodes[i].id + ",";
                name += nodes[i].name + ",";
            }
            if (id.length > 0 ) id = id.substring(0, id.length-1);
            if (name.length > 0 ) name = name.substring(0, name.length-1);
            $("#resourceIds").val(id);
            $("#resourceName").val(name);
        }

        function showMenu() {
//            var cityObj = $("#resourceName_");
//            var cityOffset = $("#resourceName_").offset();
//            $("#menuContent").css({left:"px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
            $("#menuContent").css({left:"8px", top:"35px"}).slideDown("fast");

            $("body").bind("mousedown", onBodyDown);
        }
        function hideMenu() {
            $("#menuContent").fadeOut("fast");
            $("body").unbind("mousedown", onBodyDown);
        }
        function onBodyDown(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
                hideMenu();
            }
        }

        $.fn.zTree.init($("#tree"), setting, zNodes);
        $("#menuBtn").click(showMenu);
    });
    $(function(){
        /** 新增 校验* */
        $('#role_form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                role: {
                    validators: {
                        notEmpty: {
                            message: '角色名称不能为空'
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {
                $.post(form.attr('action'), form.serialize(), function(result) {
                    if (result.status == 1) {
                        $('#main_view').load(_ctx + '/role/index');
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
                <h2>
                    编辑角色
                </h2>
        </header>
        <form:form method="post" id="role_form" commandName="role" action="${ctx}/role/save">
            <form:hidden path="id"/>
            <form:hidden path="available"/>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="role">角色名：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="role"/>
                </div>
            </div>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="description">角色描述：</form:label>
                <div class="col-lg-10">
                    <form:input cssClass="form-control" path="description" />
                </div>
            </div>
            <div class="form-group">
                <form:label cssClass="col-lg-2 control-label" path="resourceIds">拥有的资源列表：</form:label>
                <div class="col-lg-8" id="resourceName_">
                    <form:hidden path="resourceIds"/>
                    <input type="text" class="form-control" id="resourceName" name="resourceName" value="${oaTags:resourceNames(role.getResourceIdsList())}" readonly>
                    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
                        <ul id="tree" class="ztree" style="margin-top:0; width:160px;"></ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <a id="menuBtn" class="btn btn-info" href="javascript:void(0)">选择</a>
                </div>
            </div>
            <div class="modal-footer" style="text-align: left;">
                <button class="btn btn-success" type="submit">保存</button>
                <button class="btn btn-cancel" type="reset">取消</button>
            </div>
        </form:form>
    </div>
</div>
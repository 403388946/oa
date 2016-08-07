<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

    <script type="text/javascript" >
        $(function () {
            var status = "${status}";
            if(!!status) {
                alert(status);
            }
            initTable();
            //重置
            $("#g_reset").bind("click", function(){
                $('#code_').val('');
                $('#name_').val('') ;
            });
            //查询
            $("#g_search").bind("click", function(){
                queryParams();
            });
        });
        //初始化表格
        function initTable(){
             $('#customs').bootstrapTable({
                 method: 'post',
                 contentType: "json",
                 url: "${ctx}/custom/findData.json",
                 height: $(window).height() - 200,
                 striped: true,
                 pagination: true,
                 singleSelect: false,
                 showToggle: false,
                 pageSize: 10,
                 pageList: [10, 50],
                 search: false, //不显示 搜索框
                 showColumns: false, //不显示下拉框（选择显示的列）
                 sidePagination: "server", //服务端请求
                 toolbar : '#custom-toolbar',
                 queryParams: {
                     'code': $('#code_').val(),
                    'name': $('#name_').val()
                 },
                 minimunCountColumns: 2,
                 columns: [
                     {field: 'customId', checkbox: true},
                     {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value,row,index){
                         return [
                             '<a class="edit_employee_click" href="javascript:void(0);" title="Edit">',
                                '<i class="glyphicon glyphicon-edit">修改</i>',
                             '</a>',
                             '<a class="delete_employee_click" href="javascript:void(0);" title="Delete">',
                                '<i class="glyphicon glyphicon-trash">删除</i>',
                             '</a>'].join('');
                     }}
                 ],
                onLoadError: function () {alert("数据加载失败！");}
            });
        }

        //查询
        function queryParams() {
            $("#customs").bootstrapTable('refresh',{
                code: $('#code_').val(),
                name: $('#name_').val()
            });
        }

        window.operateEvents = {
            /*修改客户信息*/
            'click .edit_employee_click' : function(e, value, row, index){
                $('#main_view').load(_ctx + '/custom/edit?id=' + row.id);
            }
        };

        window.operateEvents = {
            /*删除客户信息*/
            'click .delete_employee_click' : function(e, value, row, index){
                $('#main_view').load(_ctx + '/custom/delete?id=' + row.id);
            }
        };
    </script>

        <div id="custom-toolbar">
            <div class="form-inline" role="form" id="serch_div">
                <div class="form-group">
                    编号：<input type="text" class="form-control" id="code_" name="code" placeholder="请输入客户编号" />
                </div>
                <div class="form-group">
                    姓名：<input type="text" class="form-control" id="name_" name="name" placeholder="请输入客户名称" />
                </div>
                <button type="button" id="g_search" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    查询
                </button>
                <button type="button" id="g_reset" class="btn btn-primary">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    清空查询
                </button>
            </div>
        </div>
        <table id="customs" class="table table-bordered">
        </table>


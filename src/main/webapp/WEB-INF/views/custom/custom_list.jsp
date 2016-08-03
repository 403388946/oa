<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
    <title>武汉巨龙人力资源服务系统</title>

    <script type="text/javascript" >
        $(function () {
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
                 showToggle: true,
                 pageSize: 10,
                 pageList: [10, 50],
                 search: false, //不显示 搜索框
                 showColumns: true, //不显示下拉框（选择显示的列）
                 sidePagination: "server", //服务端请求
                 queryParams: {
                     'param.code': $('#code_').val(),
                    'param.name': $('#name_').val()
                 },
                 minimunCountColumns: 2,
                 columns: [
                     {field: 'id', checkbox: true},
                     {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value,row,index){
                         return "<a href=''>修改</a><a href=''>删除</a>";
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
    </script>
</head>
<body >
        <table style="width: 100%;">
            <tbody>
            <tr>
                <th>编号</th>
                <td>
                    <input type="text" class="m-wrap small" id="code_" name="code" value="" />
                </td>
                <th>姓名</th>
                <td>
                    <input type="text" class="m-wrap small" id="name_" name="name" value="" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: right;">
                    <button type="button" id="g_search" class="btn mini green">查询</button>
                    <button type="button" id="g_reset" class="btn mini green">重置</button>
                    <button type="button" id="g_import" class="btn mini green">导出</button>
                </td>
            </tr>
            </tbody>
        </table>
        <table id="customs" class="table table-bordered">
        </table>
</body>

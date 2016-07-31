<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">

    </style>
    <script type="text/javascript" >
        $(function () {
            initTable();
            //重置
            $("#g_reset").bind("click", function(){
                $('#code').val('');
                $('#name').val('') ;
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
                contentType: "application/x-www-form-urlencoded",
                url: "${ctx}/custom/findData",
                height: $(window).height() - 200,
                striped: true,
                pagination: true,
                singleSelect: false,
                pageSize: 10,
                pageList: [10, 50],
                search: false, //不显示 搜索框
                showColumns: false, //不显示下拉框（选择显示的列）
                sidePagination: "server", //服务端请求
                queryParams: {param : {
                    code: $('#code').val(),
                    name: $('#name').val()
                }
                },
                minimunCountColumns: 2,
                 columns: [
                     {field: 'id', checkbox: true},
                     {field: 'code', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'name', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: nameFormatter},
                     {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value,row,index){
                         return "<a href=''>修改</a><a href=''>上传电子文件</a>";
                     }}
                 ],
                onLoadError: function () {alert("数据加载失败！");}
            });
        }

        //查询
        function queryParams() {
            $("#customs").bootstrapTable('refresh');
        }
    </script>
</head>
<body >
<div id="theme-wrapper">
    <!--头开始-->
    <jsp:include page="/common/header.jsp"/>
    <!--头结束-->
    <div id="page-wrapper" class="container">
        <div class="row">
            <!--左边导航开始-->
            <jsp:include page="/common/left.jsp"/>
            <!--左边导航结束-->
            <div id="content-wrapper" class="email-inbox-wrapper">
                <div class="row" style="opacity: 1;">
                    <!--正文开始-->
                    <div class="col-lg-12">
                        <table style="width: 100%;">
                            <tbody>
                            <tr>
                                <th>编号</th>
                                <td>
                                    <input type="text" class="m-wrap small" id="code" name="code" value="" />
                                </td>
                                <th>姓名</th>
                                <td>
                                    <input type="text" class="m-wrap small" id="name" name="name" value="" />
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
                    </div>
                    <div class="col-lg-12">
                        <table id="customs" class="table table-bordered">
                        </table>
                    </div>
                    <!--正文结束-->
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

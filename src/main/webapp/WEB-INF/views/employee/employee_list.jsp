<%--
  Created by IntelliJ IDEA.
  User: 46637
  Date: 2016/7/26
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
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

        });
        //初始化表格
        function initTable(){
             $('#employeeList').bootstrapTable({
                method: 'post',
                contentType: "application/x-www-form-urlencoded",
                url: "${ctx}/employee/getEmployeeList?",
                    height: $(window).height() - 200,
                    striped: true,
                    pagination: true,
                    singleSelect: false,
                    pageSize: 50,
                    pageList: [10, 50, 100, 200, 500],
                    search: false, //不显示 搜索框
                    showColumns: false, //不显示下拉框（选择显示的列）
                    sidePagination: "server", //服务端请求
                    queryParams: {
                        code : $('#code').val(),
                        name : $('#name').val(),
                        idCard : $('#idCard').val(),
                        customName : $('#customName').val()
                    },
                    minimunCountColumns: 2,
                    columns: [
                        {field: 'id', checkbox: true},
                        {field: 'code', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                        {field: 'name', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: nameFormatter},
                        {field: 'idCard', title: '身份证号码', width: 100,align: 'center',valign: 'middle',sortable: true},
                        {field: 'customCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                        {field: 'customPriceNum', title: '客户报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
                        {field: 'customName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
                        {field: 'jionDate', title: '入职日期', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value){
                            return new Date(value).Format("yyyy-MM-dd HH:mm:ss");
                        }},
                        {field: 'payCode', title: '工资卡号', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: nameFormatter},
                        {field: 'serviceStatus', title: '在职状态', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: nameFormatter},
                        {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value,row,index){

                            return "<a href=''>修改</a><a href=''>上传电子文件</a>";
                        }}
                    ],
                 onLoadError: function () {alert("数据加载失败！");}
            });
        }

        //查询
        function queryParams() {
            var queryParams = {};
            queryParamsp.code = $('#code').val();
            queryParamsp.name = $('#name').val();
            queryParamsp.idCard = $('#idCard').val();
            queryParamsp.customName = $('#customName').val();
            $("#employeeList").bootstrapTable('refresh', queryParams);
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
                                <th>身份证号码</th>
                                <td>
                                    <input type="text" class="m-wrap small" id="idCard" name="idCard" value="" />
                                </td>
                                <th>客户名称</th>
                                <td>
                                    <input type="text" class="m-wrap small" id="customName" name="customName" value="" />
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
                        <table id="employeeList" class="table table-bordered">
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

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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>武汉巨龙人力资源服务系统</title>
    <style type="text/css">
        .search-table{
            width: 100%;
            line-height:30px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/js/bootstrap.js"></script>
    <script src="${ctx}/static/js/bootstrap-table.js"></script>
    <script src="${ctx}/static/js/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" >
        $(function () {
            initTable();
            //重置
            $("#g_reset").bind("click", function(){
                $('#code').val('');
                $('#name').val('') ;
                $('#idCard').val('') ;
                $('#customName').val('');
            });
            //查询
            $("#g_search").bind("click", function(){
                search();
            });
            //导出
            $("#g_import").bind("click", function(){

            });
        });
        //初始化表格
        function initTable(){

             $('#employeeList').bootstrapTable({
                method: 'get',
                cache : false,
                sidePagination : 'server',//服务端请求
                url: "${ctx}/employee/getEmployeeList",
                height: $(window).height() -150,
                striped: false,
                pagination : 'server',
                showRefresh : true,
                singleSelect: false,
                showToggle:true,
                sortable: false,           //是否启用排序
                pagination : true,
                pageSize: 10,
                pageList: [10, 50, 100, 200, 500],
                search: false, //不显示 搜索框
                showColumns: true, //不显示下拉框（选择显示的列）
                minimunCountColumns: 2,
                 columns: [
                     {field: 'id', checkbox: true},
                     {field: 'code', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'name', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'idCard', title: '身份证号码', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'customCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'customPriceNum', title: '客户报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'customName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'jionDate', title: '入职日期', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value){
                         return new Date(value).Format("yyyy-MM-dd HH:mm:ss");
                     }},
                     {field: 'payCode', title: '工资卡号', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'serviceStatus', title: '在职状态', width: 100,align: 'center',valign: 'middle',sortable: true},
                     {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,formatter: function(value,row,index){

                         return "<a href=''>修改</a><a href=''>上传电子文件</a>";
                     }}
                 ],
//                onLoadError: function () {alert("数据加载失败！");}
            });
        }

        //查询
        function search() {
            var url = "${ctx}/employee/getEmployeeList?code=" + $('#code').val() +"&name="
                    + $('#name').val() +"&idCard=" + $('#idCard').val() +"&customName=" +$('#customName').val();
            $("#employeeList").bootstrapTable('refresh',{url:url});
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
                    <div class="col-lg-12 ">
                        <div id="custom-toolbar">
                            <div class="form-inline" role="form" id="serch_div">
                                <div class="form-group">
                                    编号：<input type="text" class="form-control" id="code" name="code" placeholder="请输入员工编号" />
                                </div>
                                <div class="form-group">
                                    姓名：<input type="text" name="name" id="name" class="form-control" placeholder="请输入员工名称" />
                                </div>
                                <div class="form-group">
                                    身份证号码:<input type="text" id="idCard" name="idCard" class="form-control" placeholder="输入身份证号码" />
                                </div>
                                <div class="form-group">
                                    客户名称:<input type="text" id="customName" name="customName" class="form-control" placeholder="输入客户名称" />
                                </div>
                                <button type="button" id="g_search" class="btn btn-default ">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    查询
                                </button>
                                <button type="button" id="g_reset" class="btn btn-default ">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    清空查询
                                </button>
                                <a href="${ctx}/employee/exportExcel" id="g_import" class="btn btn-default">导出</a>
                            </div>
                        </div>
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

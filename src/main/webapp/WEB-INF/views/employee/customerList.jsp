<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    $(function () {
        initTable();
        //重置
        $("#g_reset").bind("click", function(){
            $('#code').val('');
            $('#name').val('') ;
        });
        //查询
        $("#g_search").bind("click", function(){
            var name = $('#name').val();
            var code = $('#code').val();
            $('#customer_table').bootstrapTable('refresh', {
                url : "${ctx}/custom/findData.json?name=" + name + "&code=" + code
            });
        });

        //选中赋值
        $("#customer-select").on('click',function(){
            var selectRow = $('#customer_table').bootstrapTable('getSelections');
            if(selectRow.length == 1){
                $('#customer-modal').modal('hide');
                $('#customCode').val(selectRow[0].code);//将BusiId放入隐藏域
                $("#customName").val(selectRow[0].name);
            }else{
                alert('请选中！！！');
            }
        });
    });
    //初始化表格
    function initTable(){
        $('#customer_table').bootstrapTable({
            method: 'post',
            contentType: "application/json",
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
                code: $('#code').val(),
                name: $('#name').val()
            },
            minimunCountColumns: 2,
            columns: [
                {field : 'id', radio : true},
                {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
                {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true}
            ],
            onLoadError: function () {alert("数据加载失败！");}
        });
    }
</script>

<div id="custom-toolbar2">
    <div class="form-inline" role="form" id="customer_search_div2">
        <div class="form-group">
            <input type="text" id="cusCode" name="cusName" class="form-control" placeholder="请输入编号">
        </div>
        <div class="form-group">
            <input type="text" id="cusName" name="cusName" class="form-control" placeholder="请输入名称">
        </div>
        <button type="button" id="g_search" class="btn btn-default ">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            查询
        </button>
        <button type="button" id="g_reset" class="btn btn-default ">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            清空查询
        </button>

    </div>
    <table id="customer_table"></table>
</div>
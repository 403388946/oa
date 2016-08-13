$(function () {
    initTableCustomer();
    //重置
    $("#customer_reset").bind("click", function(){
        $('#cusCode').val('');
        $('#cusName').val('') ;
    });
    //查询
    $("#customer_search").bind("click", function(){
        var name = $('#cusName').val();
        var code = $('#cusCode').val();
        $('#customer_table').bootstrapTable('refresh', {
            url : _ctx + "/custom/queryCustom?name=" + name + "&code=" + code
        });
    });
});
//初始化表格
function initTableCustomer(){
    $('#customer_table').bootstrapTable({
        method: 'get',
        cache : false,
        sidePagination : 'server',//服务端请求
        url: _ctx + "/custom/queryCustom",
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
        toolbar : '#custom-toolbar2',
        minimunCountColumns: 2,
        columns: [
            {field : 'state', radio : true},
            {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true}
        ],
        onLoadError: function () {alert("数据加载失败！");}
    });
}
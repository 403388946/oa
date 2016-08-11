$(function () {
    initTableCustomer();
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
            url : ctx_ + "/custom/queryCustom?name=" + name + "&code=" + code
        });
    });

    //选中赋值
    $("#customer-select").on('click',function(){
        var selectRow = $('#customer_table').bootstrapTable('getSelections');
        if(selectRow.length == 1){
            $('#customCode').val(selectRow[0].code);//将BusiId放入隐藏域
            $("#customName").val(selectRow[0].name);
        }else{
            alert('请选中！！！');
        }
        $('#customer-modal').modal('hide');
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
            {field : 'id', radio : true},
            {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true}
        ],
        onLoadError: function () {alert("数据加载失败！");}
    });
}
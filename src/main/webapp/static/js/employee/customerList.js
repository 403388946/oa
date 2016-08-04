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
            url : ctx_ + "/custom/findData.json?name=" + name + "&code=" + code
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
        method: 'post',
        contentType: "application/json",
        url: ctx_ + "/custom/findData.json",
        height: $(window).height() - 600,
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
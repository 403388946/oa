$(function () {
    //初始化表格
    var customs = $('#customs').bootstrapTable({
        method: 'get',
        contentType: "json",
        url: _ctx + "/custom/findData",
        //height: 880,
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
        minimunCountColumns: 2,
        columns: [
            {field: 'customId', checkbox: true},
            {field: 'code', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'name', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'operation', title: '操作', width: 100,align: 'center',valign: 'middle',sortable: true,events: 'operateEvents',formatter: function(value,row,index){
                return [
                    '<a class="edit_custom_click"  href="javascript:void(0);" title="Edit">',
                    '<i class="glyphicon glyphicon-edit">修改</i>',
                    '</a>&nbsp;&nbsp;',
                    '<a class="delete_custom_click"  href="javascript:void(0);" title="Delete">',
                    '<i class="glyphicon glyphicon-remove">删除</i>',
                    '</a>'].join('');
            }}
        ],
        onLoadError: function () {alert("数据加载失败！");}
    });
    //重置
    $("#g_reset").bind("click", function(){
        $('#code_').val('');
        $('#name_').val('') ;
    });
    //查询
    $("#g_search").bind("click", function(){
        queryParams();
    });
    window.operateEvents = {
        /*修改客户信息*/
        'click .edit_custom_click' : function(e, value, row, index){
            $('#main_view').load(_ctx + '/custom/edit?id=' + row.id);
        },
        'click .delete_custom_click' : function(e, value, row, index){
            if(confirm("您确定删除吗?")){
                $.post(_ctx + '/custom/delete', {
                    id : row.id
                }, function(res) {
                    if (res.status == 1) {
                        $("#customs").bootstrapTable('refresh',{url: _ctx + "/custom/findData?code=" + $('#code_').val() + "&name=" + $('#name_').val()});
                    }
                    alert(res.message);
                });
            }
        }
    };
});


//查询
function queryParams() {
    $("#customs").bootstrapTable('refresh',{url: _ctx + "/custom/findData?code=" + $('#code_').val() + "&name=" + $('#name_').val()});
}
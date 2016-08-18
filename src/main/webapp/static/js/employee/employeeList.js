$(function () {
    //重置
    $("#g_reset").bind("click", function(){
        $('#code').val('');
        $('#name').val('') ;
        $('#idCard').val('') ;
        $('#customName').val('');
    });
    //查询
    $("#g_search").bind("click", function(){
        $("#employeeList").bootstrapTable('refresh',{url:$url + searchParm()});
    });
    //导出
    $("#g_import").bind("click", function(){
        window.location.href=_ctx + '/employee/exportExcel' + searchParm();
    });

    var $url = _ctx + "/employee/getEmployeeList";
    var $employee_table = $('#employeeList').bootstrapTable({
        method: 'get',
        contentType: "json",
        cache : false,
        uniqueId: "id",
        sidePagination : 'server',//服务端请求
        url: $url,
        striped: false,
        showRefresh : true,
        singleSelect: true,
        showToggle:true,
        sortable: false,           //是否启用排序
        pagination : true,
        pageSize: 10,
        pageList: [10, 50, 100, 200, 500],
        search: false, //不显示 搜索框
        showColumns: true, //不显示下拉框（选择显示的列）
        toolbar : '#employee-toolbar',
        minimunCountColumns: 2,
        columns: [
            {field: 'employeeId', title:'#', width: 30,align: 'center',valign: 'middle',sortable: true, checkbox: true},
            {field: 'code', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'name', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'idCard', title: '身份证号码', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customPriceNum', title: '客户报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'joinDateStr', title: '入职日期', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'payCode', title: '工资卡号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'serviceStatus', title: '在职状态', width: 80,align: 'center',valign: 'middle',sortable: true,formatter:function(val){
                switch (val) {
                    case 2:
                        return "<span color='#009933'>离职申请中</span>";
                    case 1:
                        return "<span color='#009933'>在职</span>";
                    case 0:
                        return "<span color='#009933'>离职</span>";
                }
            }},
            {field: 'operation', title: '操作', width: 200,align: 'center',valign: 'middle',sortable: false,formatter: function(value,row,index){
                var str_ = '<a class="edit_employee_click "  onclick="edit('+ row.id +');" href="javascript:void(0);" title="Edit">'
                    +'<i class="glyphicon glyphicon-edit">修改</i>'
                    +'</a>'
                    +'<a class="delete_employee_click " onclick="del('+ row.id +');" href="javascript:void(0);" title="Edit">'
                    +'<i class="glyphicon glyphicon-remove">删除</i>'
                    +'</a>'
                    +'<a class="upload"  data-id="' + row.id + '" href="javascript:void(0);" onclick="imageEdit(' + row.id + ')">'
                    +'<i class="glyphicon glyphicon-open">编辑文件</i>'
                    +'</a>';
                return str_;
            }}
        ]
    });
});


//获取查询条件
function searchParm(){
    var parm = "?";
    $('#employee-toolbar input').each(function(index){
        var $this = $(this), $val = $this.val(), $name = $this.attr('name');
        if (index == 0) {
            parm += $name + "=" + $val
        } else {
            parm += "&" + $name + "=" + $val
        }
    });
    return parm;
}

//修改
function edit(id){
    $('#main_view').load(_ctx + '/employee/update?id=' + id);
}
//删除
function del(id){
    if(confirm("您确定删除吗？")){
        $.post(_ctx + '/employee/delete', {
            id : id
        }, function(res) {
            if (res.status == 1) {
                $("#employeeList").bootstrapTable('refresh',{url: _ctx + "/employee/getEmployeeList" + searchParm()});
            }
            alert(res.msg);
        });
    }
}
$(function () {
    initTableEmployee();
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
function initTableEmployee(){
    $('#employeeList').bootstrapTable({
        method: 'get',
        cache : false,
        sidePagination : 'server',//服务端请求
        url: _ctx + "/employee/getEmployeeList",
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
        toolbar : '#employee-toolbar',
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
        ]
    });
}

//查询
function search() {
    var url = ctx_ + "/employee/getEmployeeList?code=" + $('#code').val() +"&name="
        + $('#name').val() +"&idCard=" + $('#idCard').val() +"&customName=" +$('#customName').val();
    $("#employeeList").bootstrapTable('refresh',{url:url});
}
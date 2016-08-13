$(function () {
    $("#serch_div input[type=text]").keydown(function(e){
        if (e && e.keyCode == 13) {$($("#agreement-toolbar button span.glyphicon-search")[0]).trigger("click");}
    });
    initTableAgreement();
    //重置
    $("#g_reset").bind("click", function(){
        $('#priceNum').val('');
        $('#customerName').val('') ;
        $('#customerCode').val('') ;
    });
    //查询
    $("#g_search").bind("click", function(){
        search();
    });
});
//初始化表格
function initTableAgreement(){
    $('#agreement_table').bootstrapTable({
        method: 'get',
        cache : false,
        sidePagination : 'server',//服务端请求
        url: ctx_ + "/agreement/selectAgreementList",
        striped: false,
        pagination : 'server',
        showRefresh : false,
        singleSelect: false,
        showToggle:false,
        sortable: false,           //是否启用排序
        pagination : true,
        pageSize: 10,
        pageList: [10, 50, 100, 200, 500],
        search: false, //不显示 搜索框
        showColumns: true, //不显示下拉框（选择显示的列）
        toolbar : '#agreement-toolbar',
        minimunCountColumns: 2,
        columns: [
            {field: 'id', radio: true},
            {field: 'priceNum', title: '报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'salary', title: '薪资', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true}
        ]
    });
}
//查询
function search() {
    var url = ctx_ + "/agreement/selectAgreementList?customerName=" + $('#customerName').val() +"&customerCode="
        + $('#customerCode').val() +"&priceNum=" + $('#priceNum').val();
    $("#agreement_table").bootstrapTable('refresh',{url:url});
}
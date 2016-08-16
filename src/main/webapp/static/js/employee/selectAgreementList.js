(function () {
    $("#search_div_agreement input[type=text]").keydown(function(e){
        if (e && e.keyCode == 13) {$($("#agreement-toolbar button span.glyphicon-search")[0]).trigger("click");}
    });
    //重置
    $("#agreenment_reset").bind("click", function(){
        $('#priceNum').val('');
        $('#customerName').val('') ;
        $('#customerCode').val('') ;
    });
    //查询
    $("#agreenment_search").bind("click", function(){
        search();
    });
    //初始化表格
   var $agreement_table = $('#agreement_table').bootstrapTable({
        method: 'get',
        cache : false,
        sidePagination : 'server',//服务端请求
        url: _ctx + "/agreement/queryAgreementByMap",
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
            {field: 'state', radio: true},
            {field: 'priceNum', title: '报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'salary', title: '薪资', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true}
        ],
        onLoadError: function () {alert("数据加载失败！");}
    });
})(jQuery);

//查询
function search() {
    var url = _ctx + "/agreement/selectAgreementList?customerName=" + $('#customerName').val() +"&customerCode="
        + $('#customerCode').val() +"&priceNum=" + $('#priceNum').val();
    $("#agreement_table").bootstrapTable('refresh',{url:url});
}
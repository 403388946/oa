(function () {
    $("#employee_search_div2 input[type=text]").keydown(function(e){
        if (e && e.keyCode == 13) {$($("#employee-toolbar2 button span.glyphicon-search")[0]).trigger("click");}
    });
    //重置
    $("#employee_reset").bind("click", function(){
        $('#employeeCode').val('');
        $('#employeeName').val('') ;
        $('#customerName').val('');
    });
    //查询
    $("#employee_search").bind("click", function(){
        $("#employee_table").bootstrapTable('refresh',{url:$url + searchParm()});
    });

    var $url = _ctx + "/employee/getSelectEmployeeList";
    var $employee_table = $('#employee_table').bootstrapTable({
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
        toolbar : '#employee-toolbar2',
        minimunCountColumns: 2,
        columns: [
            {field: 'employeeId', title:'#', width: 30,align: 'center',valign: 'middle',sortable: true, checkbox: true},
            {field: 'code', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'name', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'idCard', title: '身份证号码', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customPriceNum', title: '客户报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            /*{field: 'joinDateStr', title: '入职日期', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'payCode', title: '工资卡号', width: 100,align: 'center',valign: 'middle',sortable: true},*/
            {field: 'serviceStatus', title: '在职状态', width: 80,align: 'center',valign: 'middle',sortable: true,formatter:function(val){
                switch (val) {
                    case 2:
                        return "<span color='#009933'>离职申请中</span>";
                    case 1:
                        return "<span color='#009933'>在职</span>";
                    case 0:
                        return "<span color='#009933'>离职</span>";
                }
            }}
        ]
    });
})(jQuery);


//获取查询条件
function searchParm(){
    var parm = "?";
    $('#employee-toolbar2 input').each(function(index){
        var $this = $(this), $val = $this.val(), $name = $this.attr('name');
        if (index == 0) {
            parm += $name + "=" + $val
        } else {
            parm += "&" + $name + "=" + $val
        }
    });
    return parm;
}
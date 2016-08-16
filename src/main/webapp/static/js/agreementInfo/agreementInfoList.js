$(function () {
    $("#agreementInfo_serch_div input[type=text]").keydown(function(e){
        if (e && e.keyCode == 13) {$($("#agreementInfo_toolbar button span.glyphicon-search")[0]).trigger("click");}
    });
    $(".datetimepicker").datepicker({
        autoclose : true,// 选中之后自动隐藏日期选择框
        language : "zh-CN",
        format : "yyyy-mm-dd"// 日期格式，详见
    });

    //重置
    $("#agreementInfo_reset").bind("click", function(){
        $('#employeeName').val('');
        $('#customerName').val('') ;
        $('#version').val('') ;
        $('#agreementStartTimeStr').val('');
        $('#agreementEndTimeStr').val('');
    });
    //查询
    $("#agreementInfo_search").bind("click", function(){
        $("#agreementInfo_table").bootstrapTable('refresh',{url:$url + searchParm()});
    });
    //导出
    $("#agreementInfo_export").bind("click", function(){
        window.location.href=_ctx + '/agreementInfo/exportExcel' + searchParm();
    });

    var $url = _ctx + "/agreementInfo/queryAgreementInfoByPage";
    var $agreementInfo_table = $('#agreementInfo_table').bootstrapTable({
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
        toolbar : '#agreementInfo_toolbar',
        minimunCountColumns: 2,
        columns: [
            {field: 'agreementInfoId', title:'#', width: 30,align: 'center',valign: 'middle',sortable: true, checkbox: true},
            {field: 'employeeCode', title: '编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'employeeName', title: '姓名', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'idCard', title: '身份证号码', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerPriceNum', title: '客户报价单号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'customerName', title: '客户名称', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'employmentForm', title: '用工形式', width: 50,align: 'center',valign: 'middle',sortable: true,formatter:function(val){
                    if(val == '1'){
                        return "<span color='#009933'>代理</span>";
                    }
                    if(val == '2'){
                        return "<span color='#009933'>派遣</span>";
                    }
                }
            },
            {field: 'agreementVersion', title: '合同版本', width: 30,align: 'center',valign: 'middle',sortable: true},
            {field: 'agreementStartTime', title: '劳动合同起止时间', width: 100,align: 'center',valign: 'middle',sortable: true,formatter:function(value,row,index){
                return row.agreementStartTimeStr + ' ~ ' + row.agreementEndTimeStr;
            }},
            {field: 'serviceStatus', title: '试用期起止时间', width: 80,align: 'center',valign: 'middle',sortable: true,formatter:function(value,row,index){
                return row.testStartTimeStr + ' ~ ' + row.testEndTimeStr;
            }},
            {field: 'operation', title: '操作', width: 160,align: 'center',valign: 'middle',sortable: false,formatter: function(value,row,index){
                var str_ = '<a class="edit_agreementInfo_click "  onclick="edit('+ row.id +');" href="javascript:void(0);" title="Edit">'
                    +'<i class="glyphicon glyphicon-edit">修改</i>'
                    +'</a>&nbsp;&nbsp;'
                    +'<a class="delete_agreementInfo_click " onclick="del('+ row.id +');" href="javascript:void(0);" title="remove">'
                    +'<i class="glyphicon glyphicon-remove">删除</i>'
                    +'</a>&nbsp;&nbsp;'
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
    $('#agreementInfo_toolbar input').each(function(index){
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
    $('#main_view').load(_ctx + '/agreementInfo/update?id=' + id);
}
//删除
function del(id){
    if(confirm("您确定删除吗？")){
        $.post(_ctx + '/agreementInfo/delete', {
            id : id
        }, function(res) {
            if (res.status == 1) {
                $("#agreementInfo_table").bootstrapTable('refresh',{url: _ctx + "/agreementInfo/queryAgreementInfoByPage" + searchParm()});
            }
            alert(res.msg);
        });
    }
}


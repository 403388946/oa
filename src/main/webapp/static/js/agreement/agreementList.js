$(function () {
    $("#search_div_agreement input[type=text]").keydown(function(e){
        if (e && e.keyCode == 13) {$($("#agreement-toolbar button span.glyphicon-search")[0]).trigger("click");}
    });
    //重置
    $("#g_reset").bind("click", function(){
        $('#customerPriceNum').val('');
        $('#customerName').val('') ;
        $('#customerCode').val('') ;
        $("#agreement_table").bootstrapTable('refresh',{url:$agreement_list_url});
    });
    //查询
    $("#g_search").bind("click", function(){
        $("#agreement_table").bootstrapTable('refresh',{url:$agreement_list_url + searchParm()});
    });

    //初始化表格
    var $agreement_list_url = _ctx + "/agreement/getAgreementList";
    var $agreement_table = $('#agreement_table').bootstrapTable({
        method: 'get',
        cache : false,
        sidePagination : 'server',//服务端请求
        url: $agreement_list_url,
        striped: false,
        pagination : 'server',
        showRefresh : true,
        singleSelect: true,
        showToggle:true,
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
            {field: 'customerCode', title: '客户编号', width: 100,align: 'center',valign: 'middle',sortable: true},
            {field: 'operation', title: '操作', width: 200,align: 'center',valign: 'middle',sortable: false,events: 'operateEvents',formatter: function(value,row,index){
                return [
                    '<a class="edit_agreement_click "  href="javascript:void(0);" title="Edit">',
                    '<i class="glyphicon glyphicon-edit">修改</i>',
                    '</a>&nbsp;&nbsp;',
                    '<a class="delete_agreement_click "  href="javascript:void(0);" title="Edit">',
                    '<i class="glyphicon glyphicon-remove">删除</i>',
                    '</a>',
                ].join('');
            }}
        ],
        onLoadError: function () {alert("数据加载失败！");}
    });

    window.operateEvents = {
        /*修改员工信息*/
        'click .edit_agreement_click' : function(e, value, row, index){
            $('#agreement_modal').modal('show');
            $('#id').val(row.id);
            $('#priceNum').val(row.priceNum);
            $('#salary').val(row.salary);
            $('#customerName_').val(row.customerName);
            $('#customId').val(row.customId);
            $('#customerCode_').text(row.customerCode);

        },
        'click .delete_agreement_click' : function(e, value, row, index){
            if(confirm("您确定删除吗？")){
                $.post(_ctx + '/agreement/delete', {
                    id : row.id
                }, function(res) {
                    if (res.status > 0) {
                        $("#agreement_table").bootstrapTable('refresh',{url: $agreement_list_url});
                    }
                    alert(res.msg);
                });
            }
        }
    };

    //添加
    $('#g_add').on('click', function(){
        removeSettingVal();
        $('#agreement_modal').modal('show');
    });

    //选择客户
    $('#customerName_').on('click', function(){
        $('#customer-modal').modal('show');
        $('#customer_div').load(_ctx + '/custom/customerList');
    });

    //选中赋值
    $("#customer-select").on('click',function(){
        var selectRow = $('#customer_table').bootstrapTable('getSelections');
        if(selectRow.length == 1){
            $('#customerName_').val(selectRow[0].name);
            $('#customId').val(selectRow[0].id);
            $('#customerCode_').text(selectRow[0].code);
            $('#customer-modal').modal('hide');
        }else{
            alert('请选中！！！');
        }
    });

    /** 新增 校验* */
    $('#editFoem').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            priceNum: {
                validators: {
                    notEmpty: {
                        message: '报价单号不能为空'
                    }
                }
            },
            salary: {
                validators: {
                    notEmpty: {
                        message: '薪资不能为空'
                    },
                    regexp:{
                        regexp:/^(\d+\.[0-9]{2})|\d$/,
                        message:'优惠金额输入格式有误'
                    }
                }
            },
            customId: {
                validators: {
                    notEmpty: {
                        message: '请选择客户'
                    }
                }
            }
        },
        submitHandler: function(validator, form, submitButton) {
            var id = $('#id').val();
            var save_url = ''
            if(id != null && id != ''){
                save_url = _ctx + '/agreement/saveUpdate';
            }else{
                save_url = _ctx + '/agreement/saveAdd';
            }
            $.post(save_url, form.serialize(), function(result) {
                alert(result.msg);
                if (result.status == 1) {
                    $('#agreement_modal').modal('hide');
                    $("#agreement_table").bootstrapTable('refresh',{url:$agreement_list_url});
                }
            }, 'json');
        }
    });
    /** 新增 校验end* */
});

//获取查询条件
function searchParm(){
    var parm = "?";
    $('#agreement-toolbar input').each(function(index){
        var $this = $(this), $val = $this.val(), $name = $this.attr('name');
        if (index == 0) {
            parm += $name + "=" + $val
        } else {
            parm += "&" + $name + "=" + $val
        }
    });
    return parm;
}

function removeSettingVal(){
    $('#id').val('');
    $('#priceNum').val('');
    $('#salary').val('');
    $('#customerName_').val('');
    $('#customId').val('');
    $('#customerCode_').text('');
}
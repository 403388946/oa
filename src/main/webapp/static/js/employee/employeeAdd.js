$(function(){
    $(".datetimepicker").datepicker({
        autoclose : true,// 选中之后自动隐藏日期选择框
        language : "zh-CN",
        format : "yyyy-mm-dd"// 日期格式，详见
    });
    /*会员列表*/
    $('#selectCustom').click(function(){
        $('#customer-modal').on('show.bs.modal', function () {
            $('#customer_div').load(_ctx + '/agreement/selectAgreementList');
            //$("#customer-select").css("display","inline-block");
        });
    });

    $('#customer-select').on('click', function () {
        var selectRow = $('#agreement_table').bootstrapTable('getSelections');
        if(selectRow.length == 1){
            $('#customName').val(selectRow[0].customerName);
            $('#agreementId').val(selectRow[0].id);
            $('#customCode').val(selectRow[0].customerCode);
            $('#customPriceNum').val(selectRow[0].priceNum);
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
            code: {
                validators: {
                    notEmpty: {
                        message: '员工编号不能为空'
                    }
                }
            },
            name: {
                validators: {
                    notEmpty: {
                        message: '员工姓名不能为空'
                    }
                }
            },
            idCard: {
                validators: {
                    notEmpty: {
                        message: '身份证号不能为空'
                    },
                    callback: {
                        message: '抱歉，此身份证号已经存在',
                        callback: function(value, validator,$field) {
                            var result = false;
                            $.ajax({
                                url:_ctx +"/employee/repeatIdCard",
                                type:'get',
                                async:false,
                                data:{
                                    id:$('#id').val(),
                                    idCard: value
                                },
                                success:function(msg){
                                    if(msg.status==1){
                                        result = true;
                                    }else if (msg.status==0){
                                        result = false;
                                    }
                                }
                            });
                            return result;
                        }
                    }/*,
                    creditCard:{
                            message:'请输入正确的身份证号'
                    }*/
                }
            },
            customCode: {
                validators: {
                    notEmpty: {
                        message: '客户编号不能为空'
                    }
                }
            },
            customPriceNum: {
                validators: {
                    notEmpty: {
                        message: '客户报价单号不能为空'
                    }
                }
            },
            jionDate: {
                validators: {
                    notEmpty: {
                        message: '入职日期不能为空'
                    }/*,
                    date: {
                         format: 'YYYY-MM-DD',
                         message: '入职日期格式不正确'
                    }*/
                }
            },
            payCode: {
                validators: {
                    notEmpty: {
                        message: '工资卡号不能为空'
                    }
                }
            },
            serviceStatus: {
                validators: {
                    notEmpty: {
                        message: '在职状态不能为空'
                    }
                }
            },
            employmentForm: {
                validators: {
                    notEmpty: {
                        message: '用工形式不能为空'
                    }
                }
            }
        },
        submitHandler: function(validator, form, submitButton) {
            $.post(form.attr('action'), form.serialize(), function(result) {
                if (result.status == 1) {
                    $('#main_view').load(_ctx + '/employee/list');
                }
                alert(result.msg);
            }, 'json');
        }
    });
    /** 新增 校验end* */
});
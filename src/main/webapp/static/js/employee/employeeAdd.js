$(function(){
    $(".datetimepicker").datepicker({
        autoclose : true,// 选中之后自动隐藏日期选择框
        language : "zh-CN",
        format : "yyyy-mm-dd"// 日期格式，详见
    });
    /*会员列表*/
    $('#selectCustom').click(function(){
        $('#customer-modal').on('show.bs.modal', function () {
            $('#customer_div').load(ctx_ + '/employee/customerList');
            $("#customer-select").css("display","inline-block");
        });
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
            },
            busiNum: {
                validators: {
                    notEmpty: {
                        message: '商户号不能为空'
                    },
                    regexp:{
                        regexp:/^([0-9]){1,20}$/,
                        message:'商户号输入格式有误'
                    }
                }
            },
            busiDistrictName: {
                validators: {
                    notEmpty: {
                        message: '详细地址不能为空'
                    }
                }
            },
            contactName: {
                validators: {
                    notEmpty: {
                        message: '联系人不能为空'
                    }
                }
            },
            contactEmail: {
                validators: {
                    notEmpty: {
                        message: '联系人邮箱不能为空'
                    },
                    emailAddress: {
                        message: '请输入正确的邮箱'
                    }
                }
            }
        },
        submitHandler: function(validator, form, submitButton) {
            $.post(form.attr('action'), form.serialize(), function(result) {
                if (result.status == 1) {
                    $('#main_view', window.parent.document).load(_ctx + '/business/busi/list');
                }else{
                    $addbusiess.prop('disabled',false);
                }
                Messenger().post(result.msg);
            }, 'json');
        }
    });
    /** 新增 校验end* */
});
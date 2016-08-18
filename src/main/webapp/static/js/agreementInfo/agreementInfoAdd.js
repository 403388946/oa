$(function(){
    $(".datetimepicker").datepicker({
        autoclose : true,// 选中之后自动隐藏日期选择框
        language : "zh-CN",
        format : "yyyy-mm-dd"// 日期格式，详见
    });
    /*会员列表*/
    $('#selectEmployee').click(function(){
        $('#employee_modal').on('show.bs.modal', function () {
            $('#employee_div').load(_ctx + '/employee/selectEmployee');
        });
    });

    //选择员工
    $('#employee_select').on('click', function () {
        var selectRow = $('#employee_table').bootstrapTable('getSelections');
        if(selectRow.length == 1){
            $('#employeeId').val(selectRow[0].id);
            $('#selectEmployee').val(selectRow[0].name);
            $('#employeeCode_text').text(selectRow[0].code);
            $('#idCard_text').text(selectRow[0].idCard);
            $('#customerCode_text').text(selectRow[0].customCode);
            $('#customerName_text').text(selectRow[0].customName);
            $('#customPriceNum_text').text(selectRow[0].customPriceNum);
            if('1' == selectRow[0].employmentForm){
                $('#employmentForm_text').text('代理');
            }else{
                $('#employmentForm_text').text('派遣');
            }
            $('#employee_modal').modal('hide');
        }else{
            alert('请选中！！！');
        }
    });
    //合同起止时间的验证
    $('#agreementStartTime').on('change', function () {
        chkAgreementInfoTime($('#agreementStartTime'), $('#agreementEndTime'));
    })
    $('#agreementEndTime').on('change', function () {
        chkAgreementInfoTime($('#agreementStartTime'), $('#agreementEndTime'));
    })

    //试用期日期的验证
    $('#testStartTime').on('change', function () {
        chkAgreementInfoTime($('#testStartTime'), $('#testEndTime'));
    })
    $('#testEndTime').on('change', function () {
        chkAgreementInfoTime($('#testStartTime'), $('#testEndTime'));
    })

    /** 新增 校验* */
    $('#editFoem').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            employeeId: {
                validators: {
                    notEmpty: {
                        message: '员工信息不能为空'
                    }
                }
            },
            agreementStartTime: {
                validators: {
                    notEmpty: {
                        message: '合同开始日期不能为空'
                    }
                }
            },
            agreementEndTime: {
                validators: {
                    notEmpty: {
                        message: '合同结束日期不能为空'
                    }
                }
            },
            testStartTime: {
                validators: {
                    notEmpty: {
                        message: '试用期开始日期不能为空'
                    }
                }
            },
            testEndTime: {
                validators: {
                    notEmpty: {
                        message: '试用期结束日期不能为空'
                    }
                }
            },
            testSalary: {
                validators: {
                    notEmpty: {
                        message: '试用期工资不能为空'
                    }
                }
            },
            formalSalary: {
                validators: {
                    notEmpty: {
                        message: '正式工资不能为空'
                    }
                }
            },
            agreementVersion: {
                validators: {
                    notEmpty: {
                        message: '劳动合同版本不能为空'
                    }
                }
            },
            term: {
                validators: {
                    notEmpty: {
                        message: '劳动合同期限不能为空'
                    }
                }
            }
        },
        submitHandler: function(validator, form, submitButton) {
            console.log(112);
            $.post(form.attr('action'), form.serialize(), function(result) {
                if (result.status == 1) {
                    $('#main_view').load(_ctx + '/agreementInfo/list');
                }
                alert(result.msg);
            }, 'json');
        }
    });
    /** 新增 校验end* */
});

function chkAgreementInfoTime($startTime, $endTime){
    var agreementStartTime = $('#agreementStartTime').val();
    var agreementEndTime = $('#agreementEndTime').val();
    var testStartTime = $('#testStartTime').val();
    var testEndTime = $('#testEndTime').val();
    if(!!agreementStartTime && !!agreementEndTime && agreementStartTime > agreementEndTime){
        $('#agreementStartTime').val('');
        $('#agreementEndTime').val('');
    }
    if(!!testStartTime && !!testEndTime && testStartTime > testEndTime){
        $('#testStartTime').val('');
        $('#testEndTime').val('');
    }
    //if(!!testStartTime && !!testEndTime && !!agreementStartTime && !!agreementEndTime && (testStartTime < agreementStartTime || testEndTime > agreementEndTime || testStartTime >= agreementEndTime || testEndTime < agreementStartTime)){
    //    $startTime.val('');
    //    $endTime.val('');
    //}
    
}
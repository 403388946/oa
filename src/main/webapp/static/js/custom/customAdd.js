$(function(){

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
                        message: '客户编号不能为空'
                    }
                }
            },
            name: {
                validators: {
                    notEmpty: {
                        message: '客户名称不能为空'
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
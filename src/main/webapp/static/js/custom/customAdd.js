(function(){

    /** 新增 校验* */
    $('#editForm').bootstrapValidator({
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
                    },
                    callback: {
                        message: '抱歉，此编号已经存在',
                        callback: function(value) {
                            var result = false;
                            $.ajax({
                                url:_ctx +"/custom/validate",
                                type:'POST',
                                async:false,
                                data:{
                                    code:value
                                },
                                success:function(custom){
                                    if(custom.status == 0){
                                        result = true;
                                    }
                                }
                            });
                            return result;
                        }
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
                    $('#main_view').load(_ctx + '/custom/findPage');
                }
                alert(result.message);
            }, 'json');
        }
    });
    /** 新增 校验end* */
})(jQuery);
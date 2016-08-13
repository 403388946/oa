<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="id" required="true"%>
<%@ attribute name="saveAction" required="true"%>
<%@ attribute name="deleteAction" required="true"%>
<%@ attribute name="dateAction" required="true"%>
<%@ attribute name="title" fragment="true"%>
<%@ attribute name="message" fragment="true"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/dropzone.css"/>
<script src="${ctx}/static/js/dropzone.js" type="text/javascript"></script>
<script type="text/javascript" >
    jQuery(function() {
        $("#dropzone").dropzone({
            url: "${action}",  //
            method:"post",  //
            paramName:"file", //默认为file
            maxFiles:10,//一次性上传的文件数量上限
            maxFilesize:20,//MB
            acceptedFiles:".jpg,.png", //上传的类型
            dictMaxFilesExceeded: "您最多只能上传10个文件!",
            dictResponseError:'文件上传失败!',
            addRemoveLinks:true,
            dictRemoveFile:"移除",
            dictDefaultMessage : "<span>上传</span>",
            dictFallbackMessage:"你的浏览器不支持拖拽文件,请使用火狐浏览器!",
            dictFileTooBig:"文件过大上传文件最大支持20MB!",
            init:function() {
                this.on("success", function(file, finished) {
                    console.log(file);
                    console.log(finished);
                });
            }
        });
    });
    function imageEdit(id) {
        $.post(${dateAction},{id : id}, function(result) {
            if(result.status == 1) {
                var images = result.images;
                for(var i = 0; i < images.length; i++) {
                    var image = '<div id="oa_upload_image_' + i + '" class="dz-preview dz-processing dz-image-preview dz-success">' +
                            '<div class="dz-details">' +
                            '<div class="dz-filename">' +
                            '<span data-dz-name="">' + images[i].name + '</span>' +
                            '</div>' +
                            '<div class="dz-size" data-dz-size="">' +
                            '<strong>' + images[i].size + '</strong>KB' +
                            '</div>' +
                            '<img src="' + images[i].path + '" alt="' + images[i].name + '" data-dz-thumbnail="">' +
                            '</div>' +
                            '<div class="dz-progress">' +
                            '<span style="width: 100%;" class="dz-upload" data-dz-uploadprogress=""></span>' +
                            '</div>' +
                            '<div class="dz-success-mark">' +
                            '<span>✔</span>' +
                            '</div>' +
                            '<div class="dz-error-mark">' +
                            '<span>✘</span>' +
                            '</div>' +
                            '<div class="dz-error-message">' +
                            '<span data-dz-errormessage=""></span>' +
                            '</div>' +
                            '<a class="dz-remove" href="javascript:remove(' + images[i].id + ');">移除</a>' +
                            '</div>';
                    if(i == 0) {
                        $('#oa_upload_' + ${id} + '>div.dz-message').html(image);
                    } else {
                        $('#oa_upload_image_' + i).after(image);
                    }
                }
            }
        });

        $('#oa_upload_' + ${id}).modal();
    }
    function imageRemove(id) {
        $.post(${deleteAction},{id : id}, function(result) {

        });
    }
</script>
<!-- Modal -->
<div class="modal fade" id="oa_upload_${id}" tabindex="-1" role="dialog" aria-labelledby="fileUploadModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="fileUploadModalLabel">${empty title ? "文件上传" : title}</h4>
            </div>
            <div class="modal-body">
                <div class="main-box-body clearfix">
                    <form id="dropzone" class="dropzone dz-clickable" action="${action}">
                        <div class="dz-message">
                            <span>${empty message ? "" : message}</span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
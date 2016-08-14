<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ attribute name="id" required="true"%>
<%@ attribute name="saveAction" required="true"%>
<%@ attribute name="uploadAction" required="true"%>
<%@ attribute name="downloadAction" required="true"%>
<%@ attribute name="deleteAction" required="true"%>
<%@ attribute name="dateAction" required="true"%>
<%@ attribute name="serviceType" required="true"%>
<%@ attribute name="title" fragment="true"%>
<%@ attribute name="message" fragment="true"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/dropzone.css"/>
<script src="${ctx}/static/js/dropzone.js" type="text/javascript"></script>
<script type="text/javascript" >
    var localServiceId = 0;
    $(function() {
        $("#dropzone").dropzone({
            url: "${uploadAction}",  //
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
                    $(file.previewElement).children('.dz-remove').attr('href',"javascript:imageRemove('" + finished.fileId + "')");
                    $(file.previewElement).addClass(finished.fileId);
                    if(finished.status && localServiceId > 0) {
                        $.post("${saveAction}",{
                            serviceId : localServiceId,
                            serviceType : "${serviceType}",
                            localName : finished.localName,
                            realName : finished.realName,
                            fileId : finished.fileId,
                            fileType : finished.fileType,
                            fileSize : finished.fileSize,
                            path : finished.path
                        }, function(info) {
                            $(file.previewElement).children('.dz-details').attr('onclick','down(' + info.id + ')');
                        });
                    }
                });
            }
        });
    });
    function imageEdit(serviceId) {
        localServiceId = serviceId;
        $("#dropzone").children('.dz-preview').remove();
        $.post("${dateAction}",{serviceId : serviceId,serviceType : "${serviceType}"}, function(images) {
            if(!!images && images.length > 0) {
                for(var i = 0; i < images.length; i++) {
                    var image = '<div id="oa_upload_image_' + i + '" class="dz-preview dz-processing dz-image-preview dz-success ' + images[i].fileId + '">' +
                            '<div class="dz-details"  onclick="down(' + images[i].id + ')">' +
                            '<div class="dz-filename">' +
                            '<span data-dz-name="">' + images[i].localName + '</span>' +
                            '</div>' +
                            '<div class="dz-size" data-dz-size="">' +
                            '<strong>' + images[i].fileSize + '</strong>KB' +
                            '</div>' +
                            '<img src="' + "${downloadAction}?id=" + images[i].id + '" alt="" data-dz-thumbnail="">' +
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
                            '<a class="dz-remove" href="javascript:imageRemove(\'' + images[i].fileId + '\');">移除</a>' +
                            '</div>';
                    if(i == 0) {
                        $('#oa_upload_' + "${id}").find('div.dz-message').after(image);
                    } else {
                        $('#oa_upload_image_' + (i - 1)).after(image);
                    }
                }
            }
        });
        $('#oa_upload_' + "${id}").modal();
    }
    function imageRemove(fileId) {
        $.post("${deleteAction}",{fileId : fileId}, function(result) {
            if(result > 0) {
                $('#dropzone').children('.' + fileId).remove();
            }
        });
    }

    function down(id) {
        location.href = '${downloadAction}' + '?id=' + id;
       /* $.post("${downloadAction}",{id : id}, function(result) {
        });*/
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
                    <form id="dropzone" class="dropzone dz-clickable" action="${saveAction}">
                        <div class="dz-message">
                            <span>${empty message ? "" : message}</span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
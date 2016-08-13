<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="id" required="false"%>
<%@ attribute name="title" fragment="true"%>
<%@ attribute name="action" fragment="true"%>
<%@ attribute name="message" fragment="true"%>

<!-- Modal -->
<div class="modal fade" id="${id}" tabindex="-1" role="dialog" aria-labelledby="fileUploadModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="fileUploadModalLabel">${title}</h4>
            </div>
            <div class="modal-body">
                <div class="main-box-body clearfix">
                    <form id="dropzone" class="dropzone dz-clickable" action="${action}">
                        <div class="dz-message">
                            <span>${message}</span>
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
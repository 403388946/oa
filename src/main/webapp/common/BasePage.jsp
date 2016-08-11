<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><sitemesh:write property='title' /></title>
    <style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/nanoscroller.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.scrollToTop.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/theme_styles.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/fullcalendar.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/compiled/calendar.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/morris.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/libs/dropzone.css"/>

    <script src="${ctx}/static/js/jquery.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/moment.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-datepicker-master/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.scrollToTop.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-table.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/bootstrap-table-zh-CN.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/scripts.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/dropzone.js" type="text/javascript"></script>

    <script src="${ctx}/static/js/jquery.nanoscroller.min.js"></script>
    <script src="${ctx}/static/js/jquery-ui.custom.min.js"></script>
    <script src="${ctx}/static/js/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/static/js/morris.min.js"></script>
    <script src="${ctx}/static/js/moment.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.pie.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.stack.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.resize.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.time.min.js"></script>
    <script src="${ctx}/static/js/flot/jquery.flot.threshold.js"></script>
    <script type="text/javascript" >
        var _ctx = "${ctx}";
        jQuery(function() {
            jQuery(window).scrollToTop();
        });
        $("#dropzone").dropzone({
            url: _ctx + "/sys/upload", //必须填写
            method:"post",  //
            paramName:"file", //默认为file
            maxFiles:10,//一次性上传的文件数量上限
            maxFilesize: 20, //MB
            acceptedFiles: ".jpg,.png", //上传的类型
            previewsContainer:"#adds", //显示的容器
            //parallelUploads: 3,
            dictMaxFilesExceeded: "您最多只能上传10个文件！",
            dictResponseError: '文件上传失败!',
            dictInvalidFileType: "你不能上传该类型文件,文件类型只能是*.jpg,*.png。",
            dictFallbackMessage:"浏览器不支持",
            dictFileTooBig:"文件过大上传文件最大支持20MB",
            init:function(){
                //this.on("addedfile", function(file) {
                    //上传文件时触发的事件
                //});
                this.on("queuecomplete",function(file) {
                    //上传完成后触发的方法
                });
                this.on("removedfile",function(file){
                    //删除文件时触发的方法
                });
            }
        });
        Dropzone.options.myAwesomeDropzone = {
            paramName: "file",// input name
            method: "POST",
            maxFilesize: 2,// MB
            addRemoveLinks:true,//移除按钮
            //acceptedFiles:[jpg,png],//移除按钮
            dictDefaultMessage:"拖拽或者点击上传文件",
            dictFallbackMessage:"你的浏览器不支持拖拽文件,请使用火狐浏览器",
            accept: function(file, done) {
                if (file.name == "justinbieber.jpg") {
                    done("Naha, you don't.");
                }
                else { done(); }
            },
            fallback:function(file) {
                alert(file.status);
            }
        };
    </script>
    <sitemesh:write property='head' />
</head>
<body class="pace-done fixed-header fixed-leftmenu fixed-footer theme-blue">
    <div id="theme-wrapper">
        <!--头开始-->
        <jsp:include page="/common/header.jsp"/>
        <!--头结束-->
        <div id="page-wrapper" class="container">
            <div class="row">
                <!--左边导航开始-->
                <jsp:include page="/common/left.jsp"/>
                <!--左边导航结束-->
                <div id="content-wrapper">
                    <div class="row" style="opacity: 1;">
                        <div class="col-lg-12" id="main_view">
                            <!--正文开始-->
                            <!--正文结束-->
                            <sitemesh:write property='body' />

                        </div>
                    </div>
                    <!--结尾开始-->
                    <jsp:include page="/common/footer.jsp"/>
                    <!--结尾结束-->
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="fileUpload" tabindex="-1" role="dialog" aria-labelledby="fileUploadModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="fileUploadModalLabel">拖拽或者点击虚框上传文件</h4>
                </div>
                <div class="modal-body">
                    <div class="main-box-body clearfix">
                        <form id="dropzone" class="dropzone dz-clickable" action="${ctx}/sys/upload">
                            <div class="dz-default dz-message">
                                <span>选择文件上传</span>
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
</body>
</html>
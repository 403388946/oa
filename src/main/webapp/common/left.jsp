<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    $(function() {
        $.post(_ctx + "/menus",{},function(data) {
            if(!!data) {
                var menus = [];
                for(var i = 0; i < data.length; i++) {
                    var parent = data[i];
                    if(!!parent) {
                        var children = parent.children;
                        if(children.length > 0) {
                            menus.push('<li>');
                                menus.push('<a class="dropdown-toggle" href="#resource_' + parent.id + '">');
                                    menus.push('<span>');
                                        menus.push(parent.name);
                                    menus.push('</span>');
                                    menus.push('<i class="fa fa-chevron-circle-right drop-icon"></i>');
                                menus.push('</a>');
                                menus.push('<ul id="resource_' + parent.id + '" class="submenu" style="display: none;">');
                                for(var j = 0; j < children.length; j++) {
                                    var child = children[j];
                                    menus.push('<li>');
                                        menus.push('<a href="javascript:void(0)" class="menu_click" data-href="' + _ctx + child.url + '">');
                                            menus.push(child.name);
                                        menus.push('</a>');
                                    menus.push('</li>');
                                }
                                menus.push('</ul>');
                            menus.push('</li>');
                        } else {
                            menus.push('<li>');
                                menus.push('<a href="javascript:void(0)" class="menu_click" data-href="' + _ctx +  parent.url + '">');
                                    menus.push('<span>');
                                        menus.push(parent.name);
                                    menus.push('</span>');
                                menus.push('</a>');
                            menus.push('</li>');
                        }
                    }
                }
                if(menus.length > 0) {
                    $('#navLeft').append(menus.join(''));
                }

            }
            $.getScript(_ctx + "/static/js/scripts.js");
            $('.menu_click').on('click', function() {
                var href = $(this).attr('data-href');
                $('#main_view').load(href);
            });
        },'json');
    });
</script>
<div id="nav-col">
    <section id="col-left" class="col-left-nano">
        <div id="col-left-inner" class="col-left-nano-content">
            <div class="clearfix hidden-sm hidden-xs" id="user-left-box">
                <%--<img src="${ctx}/static/img/scarlet-159.png" alt="">--%>
                <div class="user-box">
                    <span class="name">欢迎登录,<shiro:principal/></span>
                </div>
            </div>
            <div id="sidebar-nav" class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="navLeft" class="nav nav-pills nav-stacked">
                </ul>
            </div>
        </div>
    </section>
</div>
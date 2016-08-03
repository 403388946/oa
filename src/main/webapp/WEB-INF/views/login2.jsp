<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
  javascript:window.history.forward(1);
  var _ctx = "${ctx}";
</script>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>欢迎登陆</title>
  <link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap/bootstrap.min.css"  />
  <link type="text/css" rel="stylesheet" href="${ctx }/static/css/login/login.css"/>
  <style>
    .row{width:90%;margin-top:20px;}
    .row label{width:20%;    font: bold 14px/1.4 "microsoft yahei";margin-right:10px;}
    .row input{height:22px;    width: 200px;
      height: 22px;
      padding: 5px 0;
      margin: 0;
      border: 0;
      outline: none;
      font: bold 14px/1.4 "microsoft yahei";
      line-height: 25px;
      color: #888;    font-size: smaller;    background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
    .loginbtn{background: #19B4EA;cursor: pointer;
      padding: 8px 16px;
      font-size: 18px;
      line-height: 1.3333333;
      border-radius: 6px;
      width: 150px;
      color: #fff;
      margin: 20px 150px 20px;
      font: 15px/1.4 "microsoft yahei";
    }
    .errorTip{
      font: bold 14px/1.4 "microsoft yahei";
      color:red; margin: 10px 0 -10px;
    }
  </style>
  <script src="${ctx}/static/js/jquery-1.11.0.min.js" type="text/javascript" ></script>
</head>
<body>
<div class='signup_container' style="width: 500px;margin: 10% auto 0;text-align: center;">
  <h1 class='signup_title'>欢迎登录</h1>
  <div class="col-md-7 col-md-offset-2"><br></div>
  <form id="login_form" method="post"  action="${ctx}/login">
    <div class="col-md-7 col-md-offset-2">
      <span id="noname" name="noname" style="display:none;color:red;">用户名不合法！</span>
      <div class="input-group">
        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
        <input name="username" class="form-control" placeholder="登录名" type="text" value="${username}" style="height: 30px;">
      </div>
    </div>
    <div class="col-md-8 col-md-offset-2"><br></div>
    <div class="col-md-7 col-md-offset-2">
      <span id="nopass" name="nopass" style="display:none;color:red;">密码不合法！</span>
      <div class="input-group">
        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
        <input name="password" class="form-control" placeholder="密码" type="password" value="${password}" style="display:inline;height: 30px;" onpaste="return false" onselectstart="return false">
      </div>
    </div>
    <div class="col-md-8 col-md-offset-2"><br></div>
    <div class="row">
    </div>
    <div class="errorTip">${requestScope.loginError}</div>
    <div class="loginbtn" id="loginbtn">登陆</div>
  </form>
</div>
</body>
<script type="text/javascript">
  //超时跳转到首页
  $(".navbar-fixed-top").remove();
  /* if($("body").find("#main_view").length!=0){window.location.reload(); } */
  $(document).ready(function(){
    $('.loginbtn').on("click",function(){
      var acc = $("input[name=username]").val();
      var pass = $("input[name=password]").val();
      if(acc!= ""){
        if(pass != ""){
              $('.errorTip').html('');
              $('#login_form').submit();
        }else{
          $('.errorTip').html("请输入密码！");
        }
      }else{
        $('.errorTip').html("请输入登陆名！");
      }

    });
    $("input").blur(function(){
      $('.errorTip').html("");
    });
    $('.changeImg').on("click",function(){
      var imgSrc = $(this).prev();
      var src = imgSrc.attr("data-href")+'?t='+new Date().getTime();
      imgSrc.attr("src", src);
    });
    document.onkeydown = function (event) {
      var e = event || window.event || arguments.callee.caller.arguments[0];
      if (e && e.keyCode == 13) {
        $('.loginbtn').trigger("click");
      }
    }
  });
</script>
</html>
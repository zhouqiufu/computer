<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>计算机协会，欢迎您！</title>
<link href="rearLogin/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="html/nb/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="rearLogin/js/jquery.SuperSlide.js"></script>

<script>
$(function(){

$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#username").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#username").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});


$("#password").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});


$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});

});

function check_data(){
	if($("#username").val()=='输入账号'){
		alert("用户名不能为空！");
		return false;
	}
	if($("#password").val()==''){
		alert("密码不能为空！");
		return false;
	}
	if($("#yzm").val()=='输入验证码'){
		alert("验证码不能为空！");
		return false;
	}

}
</script>


</head>

<body>

<div class="header">
<h1 class="headerLogo"><a href="<%=basePath%>index.jsp"><img alt="logo" src="rearLogin/images/logo.png" width="300" height="85"></a></h1>
	
</div>

<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box"></div>
   
   <form class="registerform" action="loginInfoAction.action" method="post">
   <div class="fm-item">
	   <label for="logonId" class="form-label">用户账号：</label>
	   <input type="text" value="输入账号" maxlength="100" id="username" class="i-text" name="loginInfo.username" >    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">登陆密码：</label>
	   <input type="password" value="" maxlength="100" id="password" class="i-text" name="loginInfo.password">    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input type="text" maxlength="4" value="输入验证码" maxlength="100" id="yzm" class="i-text yzm" nullmsg="请输入验证码！"  name="loginInfo.code" >    
       <div class="ui-form-explain"><!--  验证码存放区 --><img src="<%=basePath %>rearLogin/Image.jsp" class="yzm-img" /></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input onclick=" return check_data() " type="submit" value="" tabindex="4" id="send-btn" class="btn-login"> 
       <div class="ui-form-explain"></div>
  </div>
  
  </form>
  
  </div>

</div>

	<div class="bd">
		<ul>
			<li style="background:url(rearLogin/themes/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"></li>
			<li style="background:url(rearLogin/themes/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>


<div class="banner-shadow"></div>

<div class="footer">
   <p>最终解释权归广州城市职业学院  计算机协会 所有</p>
</div>

</body>
</html>

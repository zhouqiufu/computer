<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	$(function() {
		tm = 20;
		setTimeout('t()', 20000);
		setInterval('tt()', 1000);
	});

	function t() {

		var path = $("#home_page").attr("href");
		window.location.href = path;

	}
	function tt() {
		tm--;
		$('#show').text(tm);

	}
</script>
</head>
<body>
	<center>
	<div><br/>
	<p><font color="red">链接出错了！</font></p><br/>
		系统将在
		<div id="show"></div>
		秒后跳转到首页 <br /><br/> <a id="home_page" href="<%=basePath%>html/gcp_computer.html">手动点击返回首页</a>
		</div>
	</center>
</body>
</html>
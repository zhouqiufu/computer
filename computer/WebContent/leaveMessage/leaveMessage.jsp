<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>计协留言墙</title>


<link rel="stylesheet" type="text/css"
	href="../html/css/style_5_common.css">
<link href="../html/css/zzsc.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'
	src='<%=basePath%>maintain/maintain_files/jquery-1.8.0.min.js'></script>
<script language="javascript" type="text/javascript"
	src="../html/nb/js/zzsc.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_portal_view.css">
<style type="text/css">
#preview {
	border: 1px solid #000;
	overflow: hidden;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}

#pop_ly_id_div {
	height: 400px;
	width: 500px;
	border: 1px solid #ccc;
	background: #fff;
}

#pop_ly_id_div dl {
	margin: 0 auto;
	text-align: left;
}

#pop_ly_id_div dl dt {
	border-bottom: 1px #ccc solid;
	height: 24px;
	line-height: 24px;
	text-indent: 10px;
	padding: 5px;
}

#pop_ly_id_div dl dt span {
	float: right;
	cursor: pointer;
	font-size: 18px;
	margin-right: 5px;
}

#pop_ly_id_div dl dd {
	padding: 10px 5px 0;
	text-indent: 30px;
	text-align: left;
}

#pop_ly_id_div input, #pop_ly_id_div textarea {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
	border: 1px solid #DDDDDD;
	height: 28px;
	line-height: 28px;
	width: 340px;
	color: #999;
	text-indent: 5px;
	vertical-align: middle;
	text-align: left;
}

#pop_ly_id_div textarea {
	height: 87px;
	line-height: 22px;
}

#pop_ly_id_div #msg_vcode {
	width: 80px;
}

#pop_ly_id_div dd img {
	vertical-align: middle;
	margin-left: 5px;
	height: 22px;
	width: 80px;
}

.msg_button {
	color: #999;
	border: 1px solid #dce1e6;
	width: 120px;
	line-height: 30px;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	margin: 0 20px 20px 0;
	overflow: hidden;
	cursor: pointer;
	text-indent: 0px;
}
</style>
<script type="text/javascript">
function myReload() {
//alert("fjhgsd");
document.getElementById("vcode").src = document
.getElementById("vcode").src
+ "?nocache=" + new Date().getTime();
}</script>
<script type="text/javascript">
$(function() {

$("#msg_sub_button").click(function() {
if(check()!=false){
$("#div_show").ajaxSend(function(event, jqXHR, options) {
//alert("Ajax start");
$("#div_show").css('display', 'block');
$("#div_show").text("请求正在发送，请稍后！");
});
sunmit_data();
}

});

}); 

function check() {
var name = $.trim($("#msg_uname").val());
var text = $.trim($("#msgtext").val());
var code = $.trim($("#msg_vcode").val());
//
if (name == "请输入您的称呼") {
alert("姓名不能为空!");
return false;
}
//
if (text == "请输入留言内容") {
alert("内容不能为空!");
return false;
}
//
if (code == "请输入验证码") {
alert("验证码不能为空!");
return false;
}
//
}

//
function sunmit_data() {
var name = $.trim($("#msg_uname").val());
var mail = $.trim($("#msg_uemail").val());
var tel = $.trim($("#msg_utel").val());
var text = $.trim($("#msgtext").val());
var code = $.trim($("#msg_vcode").val());
//
$.post('MessageDispose.jsp', {
_name : name,
_mail : mail,
_tel : tel,
_text : text,
_code : code
},function(data) {
//alert($.trim(data));
//设置判断
if ($.trim(data) == "fail") {
$("#div_show").css('display', 'block');
$("#div_show").text("请求发送失败，请重新发送！");
//alert("请求发送失败！");
} else {
$("#div_show").css('display', 'block');
$("#div_show").text("请求发送成功，请勿重新发送！");
}
});

}
</script>
</head>

<body id="nv_portal" class="pg_index">

	<div id="ajaxwaitid"></div>

	<div id="toptb" class="cl">
		<div class="wp">
			<br />
			<div class="y"></div>
		</div>
	</div>



	<div id="hd">
		<div class="wp">
			<div class="hdc cl">
				<h2>
					<img
						src="../html/css/logo.png" alt="计算机协会官方网站-广州城市职业学院"
						width="357" height="131" border="0">
				</h2>

				<!-- 注册区 -->
			</div>
			<div id="nv">
				您当前所在的位置：<font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;计协留言墙&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>

			<!-- 导航条 代码 开始 -->
			<style>
.mainlevel {
	padding-left: 17.5px;
	padding-right: 17.5px;
}
</style>

		<div id="nv" style="width:950px;height:auto; background-color:#452918;" >
				<ul id="nav"  >
					<!--  <li class="mainlevel"><span class="note">Chocolate Bar</span></li>  -->

					<li class="mainlevel" style="padding-left: 30px;"><a target="_blank" href="<%=basePath%>">首页</a> </li>

					<li class="mainlevel" id="mainlevel_02"><a target="_blank" href="<%=basePath%>pagingAction.action?number=600">新闻动态</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>pagingAction.action?number=610">通知公告</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>pagingAction.action?number=620">技术交流</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>Organization/organization_index.jsp">机构设置</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>CadreDisplay/cadre_index.jsp">历届干部</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>maintain/maintain.jsp">网上报修</a></li>

					<li class="mainlevel"><a target="_blank" href="<%=basePath%>leaveMessage/leaveMessage.jsp">留言建议</a></li>
				</ul>
		</div>
			<!-- 代码 结束 -->

			<div id="nv"></div>

			
		</div>
	</div>


	<div id="wp" class="wp">
		<style id="diy_style" type="text/css">
#portal_block_165 .dxb_bc A {
	color: #000000 !important;
	font-size: 14px !important;
}

#frame8UUuhM {
	margin-top: 10px !important;
	margin-bottom: 0px !important;
	border: 0px !important;
}

#portal_block_166 {
	border-bottom: #cccccc 1px dashed !important;
	border-left: 0px !important;
	margin-top: 0px !important;
	margin-left: 10px !important;
	border-top: #cccccc 1px solid !important;
	margin-right: 10px !important;
	border-right: 0px !important;
}

#portal_block_166 .dxb_bc {
	margin-top: 0px !important;
	margin-left: 0px !important;
	margin-right: 0px !important;
}

#portal_block_165 {
	margin-top: 0px !important;
	margin-left: 0px !important;
	margin-right: 0px !important;
	border: 0px !important;
}

#portal_block_166 .dxb_bc A {
	font-size: 14px !important;
}

#portal_block_192 {
	border: 0px !important;
}

#portal_block_192 .dxb_bc {
	margin: 0px !important;
}

#framePky1Eb {
	margin-bottom: 10px !important;
	border: #cccccc 1px solid !important;
}

#portal_block_223 .dxb_bc A {
	font-size: 14px !important;
}

#portal_block_224 {
	margin-top: 10px !important;
	margin-bottom: 0px !important;
	margin-left: 0px !important;
	border: #cccccc 1px solid !important;
}

#portal_block_183 {
	margin-top: 0px !important;
	margin-left: 0px !important;
}

#portal_block_189 .dxb_bc A {
	color: #000000 !important;
	font-size: 14px !important;
}

#portal_block_189 {
	margin-top: 10px !important;
	margin-bottom: 0px !important;
	margin-left: 0px !important;
	border: 0px !important;
}

#portal_block_223 {
	margin-top: 0px !important;
}

#frame7EQ4k6 {
	border: #cccccc 1px solid !important;
}

#portal_block_247 {
	margin: 0px !important;
	border: 0px dashed !important;
}

#portal_block_247 .dxb_bc {
	margin: 0px !important;
}

#portal_block_249 .dxb_bc {
	font-size: 14px !important;
}

#portal_block_249 {
	margin-top: 10px !important;
	border: 0px !important;
}
</style>

	<div class="bm vw">

				<div class="h hm" style="height: 90px;">
					<font color="blue" size="6">您的建议是我们前进的动力！<br /> 欢迎您给我们留言！
					</font>

				</div>


				<div style="width: 1000px;">
					<center>
						<div class='getForm' id='pop_ly_id_div'>

							<dl>
								<dt style="text-align: center;">计算机协会留言墙</dt>
								<dd>
									<input type='text' id='msg_uname'
										onblur='if (this.value ==""){this.value="请输入您的称呼"}'
										onfocus='if (this.value =="请输入您的称呼"){this.value =""}'
										value='请输入您的称呼'> <b style='color: #f00'>* 必填项</b>
								</dd>
								<dd>
									<input type='text' id='msg_uemail'
										onblur='if (this.value ==""){this.value="请输入您的邮箱"}'
										onfocus='if (this.value =="请输入您的邮箱"){this.value =""}'
										value='请输入您的邮箱'>
								</dd>
								<dd>
									<input type='text' id='msg_utel'
										onblur='if (this.value ==""){value="请输入您的电话"}'
										onfocus='if (this.value =="请输入您的电话"){this.value =""}'
										value='请输入您的电话'>
								</dd>
								<dd>
									<textarea id='msgtext'
										onblur='if (this.value ==""){this.value="请输入留言内容"}'
										onfocus='if (this.value =="请输入留言内容"){value =""}'>请输入留言内容</textarea>
									<b style='color: #f00'>* 必填项</b>
								</dd>
								<dd>
<input type='text' id='msg_vcode' maxlength="4"
onblur='if (this.value ==""){this.value="请输入验证码"}'
onfocus='if (this.value =="请输入验证码"){this.value =""}'
value='请输入验证码'><img id='vcode'
src='<%=basePath%>leaveMessage/Image.jsp'>
<input type="button" onclick=" myReload() " style="text-align: center; width:auto;" value="看不清,换一个"/>

<!-- -->
</dd>
<span id="div_show"
style="display: none; background-color: #7379EE"><font
id="font_show" color="white" size="4"></font></span>
<dd>
<button class='msg_button' name='msg_sub' id='msg_sub_button'>确定</button>

</dd>

</dl>

</div>
</div>

<div class="o cl ptm pbm">
<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
</div>




</div>
</div>
</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>计算机协会维护申请表</TITLE>
<LINK href="af.css" rel="stylesheet">
<script type="text/javascript" src="jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	function myReload() {
		document.getElementById("checkcodeimg").src = document
				.getElementById("checkcodeimg").src
				+ "?nocache=" + new Date().getTime();
	}
	
	$(function() {
		$("#home_page").click(function(){
			
			window.location.href="../maintain.jsp";
		});
		
		$("#btn_sub").click(function(){
			if(check_data()!=false){
				$("#P_ajax_show").ajaxSend(function(event, jqXHR, options) {
					//alert("Ajax start");
					$("#P_ajax_show").css('display', 'block');
					$("#font_show").text("请求正在发送，请稍后！");
				});
				send_data();
			}
			
		});
		
		
	});
	
	
	//
	function send_data() {
		//姓名
		var _name = $("[name='name']").val();
		//手机号码
		var _phone = $("[name='phone']").val();
		//寝室号
		var _address = $("[name='address']").val();
		//空闲时间
		var _freetime = $("[name='freetime']").val();
		//维护类型
		var _weihu = $("[name='weihu']").val();
		//设备类型
		var _shebei = $("[name='shebei']").val();
		//软件平台
		var _pingtai = $("[name='pingtai']").val();
		//故障现象
		var _guzhang = $("[name='guzhang']").val();
		//故障详细描述
		var _content = $("[name='content']").val();
		//验证码
		var _checkcode = $("[name='checkcode']").val();
		//
		$.post('sendmail.jsp', {
			name : _name,
			phone : _phone,
			address : _address,
			freetime : _freetime,
			weihu : _weihu,
			shebei : _shebei,
			pingtai : _pingtai,
			guzhang : _guzhang,
			content : _content,
			code:_checkcode
		}, function(data) {
			//alert($.trim(data));
			//设置判断
			if ($.trim(data) == "fail") {
				$("#P_ajax_show").css('display', 'block');
				$("#font_show").text("请求发送失败，请重新发送！");
				//alert("请求发送失败！");
			} else {
				$("#P_ajax_show").css('display', 'block');
				$("#font_show").text("请求发送成功，请勿重新发送！");
			}
		});

	}
	
	function check_data() {

		if (document.getElementById('checkcode').value.length != 4) {
			alert('请正确填写验证码');
			document.getElementById('checkcode').focus();
			return false;
		}
		if (document.getElementById('AF姓名').value.length < 1) {
			alert('姓名 为必填项');
			document.getElementById('AF姓名').focus();
			return false;
		}
		if (document.getElementById('AF姓名').value.length < 2) {
			alert('姓名 的长度至少为 2');
			document.getElementById('AF姓名').focus();
			return false;
		}
		if (document.getElementById('AF姓名').value.length > 10) {
			alert('姓名 的长度至多为 10');
			document.getElementById('AF姓名').focus();
			return false;
		}
		if (document.getElementById('AF联系电话').value.length < 1) {
			alert('联系电话 为必填项');
			document.getElementById('AF联系电话').focus();
			return false;
		}
		if (document.getElementById('AF联系电话').value.length < 7) {
			alert('联系电话 的长度至少为 7');
			document.getElementById('AF联系电话').focus();
			return false;
		}
		if (document.getElementById('AF联系电话').value.length > 13) {
			alert('联系电话 的长度至多为 13');
			document.getElementById('AF联系电话').focus();
			return false;
		}

		AFC = document.getElementsByName('weihu');
		AFC_COUNT = 0;
		for (i = 0; i < AFC.length; i++) {
			if (AFC[i].checked) {
				AFC_COUNT++;
			}
		}
		if (AFC_COUNT < 1) {
			alert('维护类型 需至少选择 1 项');
			AFC[0].focus();
			return false;
		}
		AFR = document.getElementsByName('shebei');
		AFR_COUNT = 0;
		for (i = 0; i < AFR.length; i++) {
			if (AFR[i].checked) {
				AFR_COUNT++;
			}
		}
		if (AFR_COUNT < 1) {
			alert('设备类型 必须选择一项');
			AFR[0].focus();
			return false;
		}
		AFR = document.getElementsByName('pingtai');
		AFR_COUNT = 0;
		for (i = 0; i < AFR.length; i++) {
			if (AFR[i].checked) {
				AFR_COUNT++;
			}
		}
		if (AFR_COUNT < 1) {
			alert('软件平台 必须选择一项');
			AFR[0].focus();
			return false;
		}
	}
</script>

</HEAD>
<BODY>

	<p id="p_how" style="display: none;"></p>
	<center>
		<H1>计算机协会维护申请表</H1>
		<H3>创建者：计算机协会</H3>
	</center>

	<P>如果你需要进行电脑维护，可以在这里填表。提交后会向我们的技术人员发送邮件，我们将很快联系你进行解决。</P>
	<HR>

	<DIV class="AFItem AFTitle">联系方式 (协会不会将此信息透露给无关人员)</DIV>
	<DIV class="AFItem AFTextbox">
		<DIV class="name">
			<font color="#FF0000">*</font>&nbsp;&nbsp;&nbsp;姓名
		</DIV>
		<DIV class="formitem">
			<INPUT name="name" id="AF姓名" type="text" maxlength="10"
				placeholder="必填　最少2字　最多10字　" value="">
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTextbox">
		<DIV class="name">
			<font color="#FF0000">*</font>&nbsp;&nbsp;&nbsp;联系电话
		</DIV>
		<DIV class="formitem">
			<INPUT name="phone" id="AF联系电话" type="text" maxlength="13"
				placeholder="必填　最少7字　最多13字   建议填写校园网短号　" value="">
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTextbox">

		<DIV class="name">宿舍寝室</DIV>
		<DIV class="formitem">
			<INPUT name="address" id="AF宿舍寝室" type="text" placeholder="">
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTextbox">
		<DIV class="name">空闲时间</DIV>
		<DIV class="formitem">
			<INPUT name="freetime" id="AF空闲时间" type="text" placeholder="">
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTitle">维护信息</DIV>
	<DIV class="AFItem AFCheckbox">
		<DIV class="name">
			<font color="#FF0000">*</font>&nbsp;&nbsp;&nbsp;维护类型
		</DIV>
		<DIV class="formitem">
			<SPAN class="label"><INPUT name="weihu" id="AF维护类型台式机清洁"
				type="checkbox" value="台式机清洁"> <LABEL for="AF维护类型台式机清洁">台式机清洁</LABEL></SPAN><SPAN
				class="label"><INPUT name="weihu" id="AF维护类型重装系统"
				type="checkbox" value="重装系统"><LABEL for="AF维护类型重装系统">重装系统</LABEL></SPAN><SPAN
				class="label"><INPUT name="weihu" id="AF维护类型故障排除"
				type="checkbox" value="故障排除"><LABEL for="AF维护类型故障排除">故障排除</LABEL></SPAN>
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFRadio">
		<DIV class="name">
			<font color="#FF0000">*</font>&nbsp;&nbsp;&nbsp;设备类型
		</DIV>
		<DIV class="formitem">
			<SPAN class="label"><INPUT name="shebei" id="AF设备类型组装台式机"
				type="radio" value="组装台式机"><LABEL for="AF设备类型组装台式机">组装台式机</LABEL></SPAN><SPAN
				class="label"><INPUT name="shebei" id="AF设备类型品牌台式机、一体机"
				type="radio" value="品牌台式机、一体机"><LABEL for="AF设备类型品牌台式机、一体机">品牌台式机、一体机</LABEL></SPAN><SPAN
				class="label"><INPUT name="shebei" id="AF设备类型预装非 Win8 系统的笔记本"
				type="radio" value="预装非 Win8 系统的笔记本"><LABEL
				for="AF设备类型预装非 Win8 系统的笔记本">预装非 Win8 系统的笔记本</LABEL></SPAN><SPAN
				class="label"><INPUT name="shebei" id="AF设备类型预装 Win8 系统的笔记本"
				type="radio" value="预装 Win8 系统的笔记本"><LABEL
				for="AF设备类型预装 Win8 系统的笔记本">预装 Win8 系统的笔记本</LABEL></SPAN>
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFRadio">
		<DIV class="name">
			<font color="#FF0000">*</font>&nbsp;&nbsp;&nbsp;软件平台
		</DIV>
		<DIV class="formitem">
			<SPAN class="label"><INPUT name="pingtai"
				id="AF软件平台Windows XP 及更早版本" type="radio" value="Windows XP 及更早版本"><LABEL
				for="AF软件平台Windows XP 及更早版本">Windows XP 及更早版本</LABEL></SPAN><SPAN
				class="label"><INPUT name="pingtai"
				id="AF软件平台Windows Vista、7" type="radio" value="Windows Vista、7"><LABEL
				for="AF软件平台Windows Vista、7">Windows Vista、7</LABEL></SPAN><SPAN
				class="label"><INPUT name="pingtai" id="AF软件平台Windows 8 Pro"
				type="radio" value="Windows 8 Pro"><LABEL
				for="AF软件平台Windows 8 Pro">Windows 8 Pro</LABEL></SPAN><SPAN class="label"><INPUT
				name="pingtai" id="AF软件平台Windows 8 RT" type="radio"
				value="Windows 8 RT"><LABEL for="AF软件平台Windows 8 RT">Windows
					8 RT</LABEL></SPAN>
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTitle">故障信息 (作为故障排除之用，请尽量详细地填写)</DIV>
	<DIV class="AFItem AFRadio">
		<DIV class="name">故障现象</DIV>
		<DIV class="formitem">
			<SPAN class="label"><INPUT name="guzhang"
				id="AF故障现象按电源后屏幕完全没反应" type="radio" value="按电源后屏幕完全没反应"><LABEL
				for="AF故障现象按电源后屏幕完全没反应">按电源后屏幕完全没反应</LABEL></SPAN><SPAN class="label"><INPUT
				name="guzhang"
				id="AF故障现象屏幕显示 missing operating system 、ntldr(或bootmgr) is missing"
				type="radio"
				value="屏幕显示 missing operating system 、ntldr(或bootmgr) is missing"><LABEL
				for="AF故障现象屏幕显示 missing operating system 、ntldr(或bootmgr) is missing">屏幕显示
					missing operating system 、ntldr(或bootmgr) is missing</LABEL></SPAN><SPAN
				class="label"><INPUT name="guzhang" id="AF故障现象网络连接出现故障"
				type="radio" value="网络连接出现故障"><LABEL for="AF故障现象网络连接出现故障">网络连接出现故障</LABEL></SPAN><SPAN
				class="label"><INPUT name="guzhang" id="AF故障现象能登陆 QQ 不能打开网页"
				type="radio" value="能登陆 QQ 不能打开网页"><LABEL
				for="AF故障现象能登陆 QQ 不能打开网页">能登陆 QQ 不能打开网页</LABEL></SPAN><SPAN class="label"><INPUT
				name="guzhang"
				id="AF故障现象蓝屏死机，需在下方填写类似 0x00000000 的屏幕代码或 Win8 所提示的错误信息"
				type="radio" value="蓝屏死机，需在下方填写类似 0x00000000 的屏幕代码或 Win8 所提示的错误信息"><LABEL
				for="AF故障现象蓝屏死机，需在下方填写类似 0x00000000 的屏幕代码或 Win8 所提示的错误信息">蓝屏死机，需在下方填写类似
					0x00000000 的屏幕代码或 Win8 所提示的错误信息</LABEL></SPAN><SPAN class="label"><INPUT
				name="guzhang" id="AF故障现象电脑使用过程中频繁严重卡顿" type="radio"
				value="电脑使用过程中频繁严重卡顿"><LABEL for="AF故障现象电脑使用过程中频繁严重卡顿">电脑使用过程中频繁严重卡顿</LABEL></SPAN><SPAN
				class="label"><INPUT name="guzhang" id="AF故障现象U 盘等外部设备不能正常使用"
				type="radio" value="U 盘等外部设备不能正常使用"><LABEL
				for="AF故障现象U 盘等外部设备不能正常使用">U 盘等外部设备不能正常使用</LABEL></SPAN><SPAN class="label"><INPUT
				name="guzhang" id="AF故障现象其它" type="radio" value="其它"><LABEL
				for="AF故障现象其它">其它</LABEL></SPAN>
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="AFItem AFTextarea">
		<DIV class="name">故障详细描述</DIV>
		<DIV class="formitem">
			<TEXTAREA name="content" id="AF故障详细描述" placeholder=""></TEXTAREA>
		</DIV>
		<DIV class="text"></DIV>
	</DIV>
	<DIV class="button">

		<div id="P_ajax_show"
			style="background-color: #8459E8; display: none;">
			<font id="font_show" color="white"></font>
		</div>




		<IMG id="checkcodeimg" src="Image.jsp">
		<!--  -->
		<input type="button" onclick="myReload()" value=" 看不清,换一个">&nbsp;
		<!--  -->
		<INPUT name="checkcode" id="checkcode" style="-ms-ime-mode: disabled;"
			type="text" maxlength="4" placeholder="验证码" value="">
		<!--  -->
		<INPUT type="button" id="btn_sub" value="提交">
		<!--  -->
		<INPUT type="button" id="home_page" value="返回报修页面">
		<!--  -->
		<br /> <br />
	</DIV>

</BODY>
</HTML>


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

<title>发布新闻区</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_common.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_portal_view.css">

<link href="<%=basePath%>html/nb/css/zzsc.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/zzsc.js"></script>



<script type="text/javascript">
	function getValue() {
		var ofrm1 = document.getElementById("frame1").document;
		if (ofrm1 == undefined) {
			ofrm1 = document.getElementById("frame1").contentWindow.document;
			var ff = ofrm1.getElementById("redactor_content").value;
			//alert("firefox/chrome取值结果为:" + ff);
			document.getElementById("news_content").value = ff;
		} else

		{
			var ie = document.frames["frame1"].document
					.getElementById("redactor_content").value;
			//alert("ie取值结果为:" + ie);
			document.getElementById("news_content").value = ie;
		}
		$("#btn").ajaxSend(function(){
			$(this).css('color', 'red');
			$(this).val("正在发表新闻...");
			
		});
		
		$.post('News_smartupload.jsp', {
			newsTitle : $("#newsTitle").val(),
			newsAuthor : $("#newsAuthor").val(),
			newsPhotographer : $("#newsPhotographer").val(),
			newsSummary : $("#newsSummary").val(),
			news_content : $("#news_content").val()
		},function(data){
			
			if($.trim(data)=="ok"){
				alert("已经成功发表新闻 ！");
			}
			else{
				alert("发表新闻失败 ！");
			}
		});
		$("#btn").ajaxStop(function(){
			$(this).css('color', 'black');
			$(this).val("点击发布新闻");
			
		});
	}
</script>

</head>

<body id="nv_portal" class="pg_view">

	<!-- top 空行 -->
	<div id="toptb" class="cl">
		<div class="wp">
			<div class="z">
				<br>
			</div>
			<div class="y"></div>
		</div>
	</div>



	<div id="hd">
		<div class="wp">


			<!-- logo -->
			<h2>
				<img src="<%=basePath%>html/css/logo.png" alt="计算机协会官方网站-广州城市职业学院"
					width="297" height="118" border="0">
			</h2>

			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
			<br />
			<div class="fastlg cl">
				<span id="return_ls" style="display: none"></span>
				<!-- <div class="y pns">在logo的右边显示</div> -->
			</div>

			<!-- 位置显示  -->
			<div id="pt" class="bm cl">
				<span>您当前所在的位置是：<font color="red">新闻发布页面</font></span>

			</div>

			<div id="pt" class="bm cl">
				<div class="z"
					style="width: 950px; height: auto; background-color: #452918;">
					<!-- 导航条 代码 开始 -->

					<ul id="nav">

						<li class="mainlevel" style="padding-left: 30px;"><a
							target="_blank" href="<%=basePath%>">首页</a></li>

						<li class="mainlevel" id="mainlevel_02"><a target="_blank"
							href="<%=basePath%>pagingAction.action?number=600">新闻动态</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>pagingAction.action?number=610">通知公告</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>pagingAction.action?number=620">技术交流</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>Organization/organization_index.jsp">机构设置</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>CadreDisplay/cadre_index.jsp">历届干部</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>maintain/maintain.jsp">网上报修</a></li>

						<li class="mainlevel"><a target="_blank"
							href="<%=basePath%>leaveMessage/leaveMessage.jsp">留言建议</a></li>
					</ul>

					<!-- 代码 结束 -->
				</div>
			</div>

			<div id="pt" class="bm cl">
				<div class="z">
					<br>
				</div>
			</div>


			<style id="diy_style" type="text/css">
#frameuJGQFI {
	border: #cccccc 1px solid !important;
}

#portal_block_217 {
	margin: 5px !important;
}

#portal_block_217 .dxb_bc a {
	font-size: 14px !important;
}
</style>

			<div class="bm vw">
				<!-- 注意表单的enctype属性应该为：multipart/form-data -->



				<div class="h hm">
					<h1 class="ph">
						<!-- 标题 -->
						标题 <br> <input type="text" size="120" maxlength="200"
							name="newsTitle" id="newsTitle">
					</h1>
					<p class="xg1">
						供稿: <input type="text" name="newsAuthor" id="newsAuthor">
						<!-- 供稿人 -->
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 摄影: <input type="text"
							name="newsPhotographer" id="newsPhotographer">
						<!-- 摄影人 -->
					</p>

				</div>



				<div class="s">
					<div>
						<strong>摘要</strong>:
						<!-- 摘要区 -->
						<p>
							<input type="text" size="140" name="newsSummary" id="newsSummary">
						</p>


					</div>
				</div>

				<div class="d">
					<!-- 新闻内容书写区 -->
					<strong>新闻内容</strong>:
					<iframe frameborder="0" width="920" height="550" marginheight="0"
						marginwidth="0" scrolling="no" id="frame1"
						src="writeNews_files/TextEdit.html"></iframe>
					<!-- 转接新闻的内容 -->
					<input type="hidden" id="news_content" name="news_content" />
				</div>


				<div class="s"></div>

				<div style="text-align: center;">
					<input id="btn" type="button" value="点击发布新闻"
						onclick="getValue()" style="width: 200px; height: 40px;">
				</div>

				<!-- foot  -->
				<div class="o cl ptm pbm">
					<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
				</div>




			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>上传图片页面</title>

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
	<style type="text/css">
#preview {
	border: 1px solid #000;
	overflow: hidden;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
</style>
<script type="text/javascript">
	function previewImage(file) {
		var MAXWIDTH = 400;
		var MAXHEIGHT = 300;
		var div = document.getElementById('preview');
		if (file.files && file.files[0]) {
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				//                 img.style.marginLeft = rect.left+'px';
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else //兼容IE
		{
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width
					+ ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
		}
	}
	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;

			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}

		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}
</script>



</head>

<body id="nv_portal" class="pg_view" >

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

			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<div class="fastlg cl">
				<span id="return_ls" style="display: none"></span>
				<!-- <div class="y pns">在logo的右边显示</div> -->
			</div>

			<!-- 位置显示  -->
			<div id="pt" class="bm cl">
				<span>您当前所在的位置是：<font color="red">上传图片页面</font></span>

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

				<form action="uploadPhotoProcess.jsp" method="post"
					enctype="multipart/form-data">

					<div class="h hm">
						<h1>
							<font size="+2">上传图片</font>
						</h1>

					</div>

					<!-- 上传图片，最好50k以下  -->
					<div class="s"></div>

					<div class="s" style="height: auto;">
						<br>
						<!-- 上传图片的代码 -->
						<div
							style="width: 500px; height: 96px; margin: 0px auto; border: 2px #00F solid; border-bottom-style: none;">
						
							<table width="500" align="center" border="0" cellpadding="4"
								cellspacing="1" bgcolor="#cccccc">
								<tbody>
									<tr bgcolor="#EEEEEE" align="center">
										<td colspan="2">上传照片</td>
									</tr>

									<tr bgcolor="#ffffff">

										<td>图片说明：</td>
										<td><input name="photo_explain" type="text" size="45"></td>
									</tr>

									<tr bgcolor="#ffffff">
										<td>照片：</td>
										<td><input name="upfile" type="file"
											onChange="previewImage(this)" size="30"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 图片预览区 -->
						<div title="图片预览区" id="preview"
							style="width: 500px; height: 300; margin: 0px auto; text-align: center; border: 2px #00F solid;">

							<img id=" imghead" width="481" height="254" border="0"
								src="unknown.jpg">
						</div>
					</div>

					<div style="text-align: center;">
						<input type="submit" value="点击上传图片" 
							style="width: 200px; height: 40px;">
					</div>
				</form>
				<!-- foot  -->
				<div class="o cl ptm pbm">
					<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
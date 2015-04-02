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



<title>计协网上报修系统</title>


<link rel="stylesheet" type="text/css"
	href="../html/css/style_5_common.css">
<link href="../html/css/zzsc.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="../html/nb/js/jquery-1.4.2.js"></script>
<script language="javascript" type="text/javascript"
	src="../html/nb/js/zzsc.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_portal_view.css">
<script language="javascript" type="text/javascript">
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	(function($) {
		// alert($.fn.scrollLoading);
		$.fn.scrollLoading = function(options) {
			var defaults = {
				attr : "data-url"
			};
			var params = $.extend({}, defaults, options || {});
			params.cache = [];
			$(this).each(
					function() {
						var node = this.nodeName.toLowerCase(), url = $(this)
								.attr(params["attr"]);
						if (!url) {
							return;
						}
						var data = {
							obj : $(this),
							tag : node,
							url : url
						};
						params.cache.push(data);
					});

			var loading = function() {
				var st = $(window).scrollTop(), sth = st + $(window).height();
				$.each(params.cache, function(i, data) {
					var o = data.obj, tag = data.tag, url = data.url;
					if (o) {
						post = o.position().top;
						posb = post + o.height();
						if ((post > st && post < sth)
								|| (posb > st && posb < sth)) {
							if (tag === "img") {
								o.attr("src", url);
							} else {
								o.load(url);
							}
							data.obj = null;
						}
					}
				});
				return false;
			};

			loading();
			$(window).bind("scroll", loading);
		};
	})(jQuery);

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	$(document).ready(function() {

		$("img").load(function() {

			$(this).hide();

			$(this).fadeIn("5000");
		});

		$(".scrollLoading").scrollLoading();
	});
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
				您当前所在的位置：<font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;网上报修&nbsp;&nbsp;&nbsp;&nbsp;</font>
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

		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area">
				<div id="frameML1Ccp" class="frame move-span cl frame-1">
					<div id="frameML1Ccp_left" class="column frame-1-c">
						<div id="frameML1Ccp_left_temp" class="move-span temp"></div>
						<div id="portal_block_247" class="block move-span">
							<div id="portal_block_247_content" class="dxb_bc">
								<div class="portal_block_summary">


									<div id="bm_24074894_0.7331394802313298"
										style="width: 960px; height:auto; background-color:#7263C9;">
                                        <div style="text-align: center;">
				<font size="+3" color="#FFFFFF">欢迎使用计算机协会的网上报修系统，<br />计算机协会将竭诚为您服务！
				</font> <br />
				<br />
			</div>
            		<div style="text-align: center;">
				<a target="_blank" href="maintain_files/maintain_table.jsp"><img
					class="scrollLoading" data-url="maintain_files/65687.jpg"
					width="410" height="296" /></a>
			</div>
                                        <div style="text-align: center;">
											<br />
											<font size="+4" color="#FF0000"><a target="_blank"
												href="maintain_files/maintain_table.jsp">我要报修</a></font>
										</div>
                                        
                                        </div>
								</div>
								<div class="module cl xl xl1">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				
  <div id="frameA6AB6i" class="frame move-span cl frame-1">
					<div id="frameA6AB6i_left" class="column frame-1-c">
						<div id="frameA6AB6i_left_temp" class="move-span temp"></div>
						<div id="portal_block_172" class="block move-span">
							<div id="portal_block_172_content" class="dxb_bc">
								<div class="module cl ml"> <p style=" text-align:center;">最终解释权归广州城市职业学院计算机协会所有</p></div>
							</div>
						</div>
					</div>
  </div>
			</div>
		</div>
	</div>
	
	
</body>
</html>
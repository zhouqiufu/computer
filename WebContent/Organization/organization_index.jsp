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



<title>计协各机构简介</title>


<link rel="stylesheet" type="text/css"
	href="../html/css/style_5_common.css">
<link href="../html/css/zzsc.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="../html/nb/js/jquery-1.4.2.js"></script>
<script language="javascript" type="text/javascript"
	src="../html/nb/js/zzsc.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_portal_view.css">

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
				<!-- logo -->
			<h2>
				<img src="<%=basePath%>html/css/logo.png" alt="计算机协会官方网站-广州城市职业学院"
					width="297" height="118" border="0">
			</h2>

				<!-- 注册区 -->
			</div>
			<div id="nv">
				您当前所在的位置：<font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;计协机构介绍&nbsp;&nbsp;&nbsp;&nbsp;</font>
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




				<div class="d" style="text-align: center;">
					<!-- 新闻内容书写区 -->
					<br />

					<p>
						<a target="_blank" href="../Organization/group120.html">计算机协会120小组简介</a>
					</p>

					<p>
						<a target="_blank"
							href="../Organization/public_relations.html">计算机协会外联部简介</a>
					</p>

					<p>
						<a target="_blank" href="../Organization/publicity.html">计算机协会宣传部简介</a>
					</p>

					<p>
						<a target="_blank" href="../Organization/secretary.html">计算机协会秘书部简介</a>
					</p>

					<p>
						<a target="_blank"
							href="../Organization/technology.html">计算机协会技术部简介</a>
					</p>
					<br />
				</div>


				<div class="s"></div>





				<!-- foot  -->
				<div class="o cl ptm pbm">
					<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
				</div>




			</div>
		</div>
	</div>
</body>
</html>
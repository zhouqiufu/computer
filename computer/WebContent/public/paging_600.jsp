<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,java.io.*,java.sql.*,com.DynamicNewsArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.DynamicNewsArea.service.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,com.DynamicNewsArea.domain.*,java.util.Date,java.text.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.DynamicNewsArea.service.*"%>

<%@ page
	import="com.jspsmart.upload.*,java.sql.*,com.DynamicNewsArea.domain.*,java.util.Date,java.text.*"%>
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

<title>计协新闻</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath %>html/css/style_5_common.css">
	
<link href="<%=basePath %>html/nb/css/zzsc.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript"
	src="<%=basePath %>html/nb/js/jquery-1.4.2.js"></script>
	
<script language="javascript" type="text/javascript"
	src="<%=basePath %>html/nb/js/zzsc.js"></script>
	
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
					<a
						href="<%=basePath%>"
						title="计算机协会官方|计算机协会官方网站-滁州职业技术学院"><img
						src="<%=basePath %>html/css/logo.png" alt="计算机协会官方|计算机协会官方网站-广州城市职业学院"
						width="357" height="131" border="0"></a>
				</h2>

			<!-- 	注册区 -->
			</div>
			<div id="nv">
				您当前所在的位置：<font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;协会新闻浏览&nbsp;&nbsp;&nbsp;&nbsp;</font>
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
					
					<li class="mainlevel" style="padding-left: 30px;"><a href="<%=basePath%>">首页</a> </li>

					<li class="mainlevel" id="mainlevel_02"><a href="<%=basePath%>pagingAction.action?number=600">新闻动态</a></li>

					<li class="mainlevel"><a href="<%=basePath%>pagingAction.action?number=610">通知公告</a></li>

					<li class="mainlevel"><a href="<%=basePath%>pagingAction.action?number=620">技术交流</a></li>

					<li class="mainlevel"><a href="<%=basePath%>Organization/organization_index.jsp">机构设置</a></li>

					<li class="mainlevel"><a href="<%=basePath%>CadreDisplay/cadre_index.jsp">历届干部</a></li>

					<li class="mainlevel"><a href="<%=basePath%>maintain/maintain.jsp">网上报修</a></li>

					<li class="mainlevel"><a href="<%=basePath%>leaveMessage/leaveMessage.jsp">留言建议</a></li>
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
								<div class="portal_block_summary" style="text-align:center;font-size:20px;">

								<input type="hidden" name="pageNum_">
								<input type="hidden" name="firstResult_arg" />
	<%
		//数据库指针位置：
		String firstResult_arg = request.getParameter("firstResult_arg");
	%>
	<%
		PrintWriter out_writer = response.getWriter();
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
		"beans.xml");
		DynamicNewsAreaService dynamicNewsAreaService = (DynamicNewsAreaService) appContext
		.getBean("dynamicNewsAreaService");
		
		int maxRowCount = dynamicNewsAreaService.getTotalResult();// 一共有多少行

		int maxPage; // 一共有多少页
		int rowsPerPage = 20;// 每页多少行

		// 根据总行数计算总页数
		if (maxRowCount % rowsPerPage == 0) {
			maxPage = maxRowCount / rowsPerPage;
		} else {
			maxPage = maxRowCount / rowsPerPage + 1;
		}
		
		
		if(firstResult_arg==null||firstResult_arg==""){
			firstResult_arg ="0";
			
			List<DynamicNewsArea>  list = dynamicNewsAreaService.getPagingResult(Integer.parseInt(firstResult_arg), rowsPerPage);
			
			Iterator iterator = list.iterator();
			DynamicNewsArea dynamicNewsArea = null;
			while(iterator.hasNext()){
		dynamicNewsArea = (DynamicNewsArea)iterator.next();
		%>
		
		
		<br/>
		<a target="_blank" href="<%=basePath %><%= dynamicNewsArea.getHtml_path()%>"><%= dynamicNewsArea.getNewsTitle()%></a>	
		
		<%	
			}	
		}
		else{
			
			List<DynamicNewsArea>  list =  dynamicNewsAreaService.getPagingResult(Integer.parseInt(firstResult_arg), rowsPerPage);
			Iterator iterator = list.iterator();
			DynamicNewsArea dynamicNewsArea = null;
			while(iterator.hasNext()){
		dynamicNewsArea = (DynamicNewsArea)iterator.next();
		%>
		<br/>
		<a target="_blank" href="<%=basePath %><%=dynamicNewsArea.getHtml_path()%>"><%=dynamicNewsArea.getNewsTitle()%></a>
			
		<%
			}
		}
		
		%>
		
		<br/>
		<br/>
		<style>
			
		 .nv_page{ 
		   padding:0px;
		   list-style-type:none;
		   display:inline;
		  // border:solid;
		 }
		 a:hover{
		    color:red;
		 } 
		</style>

		<ul>
	
		<%
	
		String num_ = request.getParameter("pageNum_");
		if(num_==null){
			request.getSession().setAttribute("pageNumNow", "1");
		}
		else{
			request.getSession().setAttribute("pageNumNow", num_);
		}
		
		%>
	
		<br/><font size="0.5">页数</font>
		
		<%
		for (int i = 1; i <= maxPage; i++) {

			if (i == 1) {
		%>

	  <li class="nv_page"><a class='btn' href="<%=basePath%>public/paging_600.jsp?firstResult_arg=0&pageNum_=<%=i %>">
		<font size="+1" style="background:yellow;"><%=i %></font></a>
	</li>
		<%
			} else {
		%>
		<%
			int temp_pageNum = (( (i - 1) * rowsPerPage )+ 1);
		%>
		<li class="nv_page"><a class='btn' href="<%= basePath%>public/paging_600.jsp?firstResult_arg=<%=temp_pageNum %>&pageNum_=<%=i %>"> 
		        <font size="+1" style="background:yellow;"><%=i %></font>
		    </a>
		</li>
		
		<%
			}
		}
		%>
		</ul>
		<br/>
		<font size="0.5">当前页数：&nbsp;<span >第&nbsp;<%=request.getSession().getAttribute("pageNumNow") %>&nbsp;页</span></font>
				              
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
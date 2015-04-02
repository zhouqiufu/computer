<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.DynamicNewsArea.service.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,com.DynamicNewsArea.domain.*,java.util.*,java.text.*"%>
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

<title>删除新闻页面：新闻列表</title>

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
				<span>您当前所在的位置是：<font color="red">删除新闻页面：新闻列表</font></span>

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



				<div class="h hm"></div>

				<script type="text/javascript">
			function send_data(num){
				
				
				var data_news = $.trim($("#data_td_"+num).text());
				$.post('DeleteNews.jsp',{news_title:data_news},function(data){
					if($.trim(data)!=false){
						$("#btn_"+num).attr('disabled',true);
						$("#btn_"+num).css('color','red')
						$("#btn_"+num).val("已删除");
						//alert("数据删除成功 ！");
						
					}
					else{
						alert("数据删除失败 ！");
					}
					
				});
				
			}
			</script>

				<div class="s">
					<div style="text-align: center;">
						<table border="solid " border-color="#03C">
							<tr>
								<td><font size="+1" color="red">&nbsp;&nbsp;新闻标题&nbsp;&nbsp;</font></td>

								<td><font size="+1" color="red">&nbsp;&nbsp;操作&nbsp;&nbsp;</font></td>
							</tr>
							<%
								//设置request范围字符集
								request.setCharacterEncoding("UTF-8");
									
								ApplicationContext appContext = new ClassPathXmlApplicationContext(
								"beans.xml");
								DynamicNewsAreaService dynamicNewsAreaService = (DynamicNewsAreaService) appContext
								.getBean("dynamicNewsAreaService");
								List<DynamicNewsArea> list_allTitle = dynamicNewsAreaService.getAllNewsTitle();
								Iterator<DynamicNewsArea> iterator_allTitle = list_allTitle.iterator();
								int all_num = dynamicNewsAreaService.getTotalResult();
								while(iterator_allTitle.hasNext()){
									DynamicNewsArea dynamicNewsArea_allTitle = iterator_allTitle.next();
							%>

							<tr>
								<td id="data_td_<%=all_num%>">&nbsp;&nbsp;<%=dynamicNewsArea_allTitle.getNewsTitle()%>&nbsp;&nbsp;
								</td>

								<td><input id="btn_<%=all_num%>" onclick="send_data(<%=all_num%>)" type="button"
									value="&nbsp;&nbsp;删除&nbsp;&nbsp;"></td>
							</tr>

							<%
								all_num--;
									}
							%>
						</table>
					</div>
				</div>

				<div class="d"></div>


				<!-- foot  -->
				<div class="o cl ptm pbm">
					<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
				</div>




			</div>
		</div>
	</div>
</body>
</html>
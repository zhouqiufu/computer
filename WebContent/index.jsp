<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.*,java.io.*,java.sql.*,com.DynamicNewsArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.DynamicNewsArea.service.*"%>

<%@ page import="com.AnnounceArea.domain.*,com.AnnounceArea.service.*"%>

<%@ page
	import="com.TechnologyArea.domain.*,com.TechnologyArea.service.*"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page
	import="com.recordUserNumber.domain.RecordUserNumber,com.recordUserNumber.service.RecordUserNumberService"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

	<%
		if (request.getSession().getAttribute("user") == null) {

			request.getSession().setAttribute("user", "user");

			//数据库操作

			ApplicationContext appContext = new ClassPathXmlApplicationContext(
					"beans.xml");
			RecordUserNumberService recordUserNumberService = (RecordUserNumberService) appContext
					.getBean("recordUserNumberService");

			RecordUserNumber recordUserNumber = new RecordUserNumber();

			//
			Date common_date = new Date();
			// 输出年月日
			// DateFormat short_date = DateFormat.getDateInstance();

			// 输出完整的年月日时分秒
			DateFormat full_Time = DateFormat.getDateTimeInstance(
					DateFormat.MEDIUM, DateFormat.MEDIUM);

			recordUserNumber.setLoginTime(full_Time.format(common_date));

			recordUserNumberService.add(recordUserNumber);

			//int number = recordUserNumberService.getTotalResult();

			//System.out.println("历史总浏览量：  " + number);

		}

		
	%>
<%
		//新闻动态模块
		//定义数组
		String[] title_600 = new String[14];
		String[] htmlPath_600 = new String[14];
		
		ApplicationContext appContext_600 = new ClassPathXmlApplicationContext(
		"beans.xml");
		DynamicNewsAreaService dynamicNewsAreaService_600 = (DynamicNewsAreaService) appContext_600
		.getBean("dynamicNewsAreaService");
		
		List<DynamicNewsArea> list_600 = dynamicNewsAreaService_600.get_13_newsTitle();
		
			    Iterator<DynamicNewsArea> iterator_600 = list_600.iterator();
		int i = 1;//新闻从开始计数
		
			    while(iterator_600.hasNext()&&i<14){
			    	
			    	DynamicNewsArea dynamicNewsArea_600 = iterator_600.next();
			                            					
			    	title_600[i] = dynamicNewsArea_600.getNewsTitle();
			    	htmlPath_600[i] = dynamicNewsArea_600.getHtml_path();
			    	//System.out.println(htmlPath_600[i]);
			    	i++;
			    }
	%>

	<%
		//协会通知模块
			//定义数组
		String[] title_610 = new String[6];
		String[] htmlPath_610 = new String[6];
		String[] date_610 = new String[6];
		
		ApplicationContext appContext_610 = new ClassPathXmlApplicationContext(
		"beans.xml");
		announceService announceService_610 = (announceService) appContext_610
		.getBean("announceService");
		
		List<AnnounceDomain> list_610 = announceService_610.get_5_AnnounceTitle();
		//System.out.println(list_610);
			   Iterator<AnnounceDomain> iterator_610 = list_610.iterator();
		int i_610 = 1;//通知从开始计数
		
			    while(iterator_610.hasNext()&&i_610<6){
			    	
			    	AnnounceDomain announceDomain_610 = iterator_610.next();
			                            					
			    	title_610[i_610] = announceDomain_610.getAnnounceTitle();
			    	htmlPath_610[i_610] = announceDomain_610.getHtml_path();
			    	date_610[i_610] = announceDomain_610.getNewsDate();
			    	
			    	//System.out.println(title_610[i_610]+htmlPath_610[i_610]+date_610[i_610] );
			    	i_610++;
			    }
	%>

	<%
		//技术文章模块
			//定义数组
		String[] title_620 = new String[12];
		String[] htmlPath_620 = new String[12];
		
		
		ApplicationContext appContext_620 = new ClassPathXmlApplicationContext(
		"beans.xml");
		TechnologyAreaService technologyAreaService_620 = (TechnologyAreaService) appContext_620
		.getBean("technologyAreaService");
		
		List<TechnologyArea> list_620 = technologyAreaService_620.get_11_newsTitle();
		
			    Iterator<TechnologyArea> iterator_620 = list_620.iterator();
		int i_620 = 1;//通知从开始计数
		
			    while(iterator_620.hasNext()&&i_620<12){
			    	
			    	TechnologyArea technologyArea_620 = iterator_620.next();
			                            					
			    	title_620[i_620] = technologyArea_620.getTechnologyTitle();
			    	htmlPath_620[i_620] = technologyArea_620.getHtml_path();
			    	//System.out.println(title_610[i_610]+htmlPath_610[i_610]);
			    	i_620++;
			    }
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计算机协会官方网站</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>html/css/style_5_common.css">
<link href="<%=basePath%>html/nb/css/zzsc.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/zzsc.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/jquery.carouFredSel-6.0.4-packed.js"></script>
<script src="<%=basePath%>DynamicPhoto/js/jquery.slideBox.min.js"
	type="text/javascript"></script>
<link href="<%=basePath%>DynamicPhoto/css/jquery.slideBox.css"
	rel="stylesheet" type="text/css" />
<script>
	jQuery(function($) {
		$('#demo1').slideBox();
	});
</script>

<style type="text/css">
#wrapper h3 {
	font-size: 20px;
	text-align: center;
}

#wrapper>div {
	background-color: #eee;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	width: 100%;
	height: 11px;
	padding: 15px 0;
	overflow: hidden;
}

#wrapper>div.first {
	border-bottom: none;
}

#wrapper dl {
	display: block;
	margin: 0;
}

#wrapper dt, #wrapper dd {
	display: block;
	float: left;
	margin: 0 10px;
	padding: 5px 10px;
}

#wrapper dt {
	background-color: #f66;
	color: #fff;
}

#wrapper dd {
	color: #333;
	margin-right: 50px;
}

code {
	font-style: italic;
}

#donate-spacer {
	height: 100%;
}

#donate {
	border-top: 1px solid #999;
	width: 750px;
	padding: 50px 75px;
	margin: 0 auto;
	overflow: hidden;
}

#donate p, #donate form {
	margin: 0;
	float: left;
}

#donate p {
	width: 650px;
}

#donate form {
	width: 100px;
}
</style>

<script src="<%=basePath%>html/jquery.carouFredSel-6.0.4-packed.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		var _scroll = {
			delay : 1000,
			easing : 'linear',
			items : 1,
			duration : 0.07,
			timeoutDuration : 0,
			pauseOnHover : 'immediate'
		};
		$('#ticker-1').carouFredSel({
			width : 1000,
			align : false,
			items : {
				width : 'variable',
				height : 35,
				visible : 1
			},
			scroll : _scroll
		});

		$('#ticker-2').carouFredSel({
			width : 1000,
			align : false,
			circular : false,
			items : {
				width : 'variable',
				height : 35,
				visible : 2
			},
			scroll : _scroll
		});

		//	set carousels to be 100% wide
		$('.caroufredsel_wrapper').css('width', '100%');

		//	set a large width on the last DD so the ticker won't show the first item at the end
		$('#ticker-2 dd:last').width(2000);
	});
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
					<a href="<%=basePath%>" title="计算机协会官方|计算机协会官方网站-滁州职业技术学院"><img
						src="<%=basePath%>html/css/logo.png"
						alt="计算机协会官方|计算机协会官方网站-广州城市职业学院" width="357" height="131"
						border="0"></a>
				</h2>

				<!-- 	注册区 -->
			</div>
			<div id="nv">
				您当前所在的位置：<font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</div>

			<!-- 导航条 代码 开始 -->
			<style>
.mainlevel {
	padding-left: 17.5px;
	padding-right: 17.5px;
}
</style>
			
			<div id="nv"
				style="width: 950px; height: auto; background-color: #452918;">
				<ul id="nav">

					<li class="mainlevel" style="padding-left: 30px;"><a id="li_1"
						target="_blank" href="<%=basePath %>">首页</a></li>

					<li class="mainlevel"><a target="_blank" id="li_2" href="<%=basePath %>pagingAction.action?number=600">新闻动态</a></li>

					<li class="mainlevel"><a target="_blank" id="li_3" href="<%=basePath %>pagingAction.action?number=610">通知公告</a></li>

					<li class="mainlevel"><a target="_blank" id="li_4" href="<%=basePath %>pagingAction.action?number=620">技术交流</a></li>

					<li class="mainlevel"><a target="_blank" id="li_5" href="<%=basePath %>Organization/organization_index.jsp">机构设置</a></li>

					<li class="mainlevel"><a target="_blank" id="li_6" href="<%=basePath %>CadreDisplay/cadre_index.jsp">历届干部</a></li>

					<li class="mainlevel"><a target="_blank" id="li_7" href="<%=basePath %>maintain/maintain.jsp">网上报修</a></li>

					<li class="mainlevel"><a target="_blank" id="li_8" href="<%=basePath %>leaveMessage/leaveMessage.jsp">留言建议</a></li>
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
										style="width: 960px; height: auto; text-align: center;">


										<LINK rel=stylesheet type=text/css
											href="<%=basePath%>html/css/lrtk.css">
										<DIV id=container class=banner
											style="width: 960px; height: 50px;">
											<OL>
												<LI><A href="#" target=_blank><IMG
														style="width: 960px; height: 40px;"
														src="<%=basePath%>html/images/01.jpg"></A></LI>
												<LI><A href="#" target=_blank><IMG
														style="width: 960px; height: 40px;"
														src="<%=basePath%>html/images/02.jpg"></A></LI>
											</OL>
											<DIV class=mouse_direction>
												<DIV class=mouse_top></DIV>
												<DIV class=mouse_bottom></DIV>
											</DIV>
										</DIV>
										<script type=text/javascript>
											$(function() {
												var index = 0;
												var adtimer;
												var _wrap = $("#container ol"); //
												var len = $("#container ol li").length;
												//len=1;
												if (len > 1) {
													$("#container")
															.hover(
																	function() {
																		clearInterval(adtimer);
																	},
																	function() {
																		adtimer = setInterval(
																				function() {

																					var _field = _wrap
																							.find('li:first'); //此变量不可放置于函数起始处,li:first取值是变化的
																					var _h = _field
																							.height(); //取得每次滚动高度(多行滚动情况下,此变量不可置于开始处,否则会有间隔时长延时)
																					_field
																							.animate(
																									{
																										marginTop : -_h
																												+ 'px'
																									},
																									500,
																									function() { //通过取负margin值,隐藏第一行
																										_field
																												.css(
																														'marginTop',
																														0)
																												.appendTo(
																														_wrap); //隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
																									})

																				},
																				3800);
																	})
															.trigger(
																	"mouseleave");
													function showImg(index) {
														var Height = $(
																"#container")
																.height();
														$("#container ol")
																.stop()
																.animate(
																		{
																			marginTop : -_h
																					+ 'px'
																		}, 1000);
													}

													$("#container")
															.mouseover(
																	function() {
																		$(
																				"#container .mouse_direction")
																				.css(
																						"display",
																						"block");
																	});
													$("#container")
															.mouseout(
																	function() {
																		$(
																				"#container .mouse_direction")
																				.css(
																						"display",
																						"none");
																	});
												}

												$("#container")
														.find(".mouse_top")
														.click(
																function() {
																	var _field = _wrap
																			.find('li:first'); //此变量不可放置于函数起始处,li:first取值是变化的
																	var last = _wrap
																			.find('li:last'); //此变量不可放置于函数起始处,li:last取值是变化的
																	//last.prependTo(_wrap);
																	var _h = last
																			.height();
																	$(
																			"#container ol")
																			.css(
																					'marginTop',
																					-_h
																							+ "px");
																	last
																			.prependTo(_wrap);
																	$(
																			"#container ol")
																			.animate(
																					{
																						marginTop : 0
																					},
																					500,
																					function() { //通过取负margin值,隐藏第一行
																						//$("#container ol").css('marginTop',0).prependTo(_wrap);//隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
																					})
																});
												$("#container")
														.find(".mouse_bottom")
														.click(
																function() {
																	var _field = _wrap
																			.find('li:first'); //此变量不可放置于函数起始处,li:first取值是变化的
																	var _h = _field
																			.height();
																	_field
																			.animate(
																					{
																						marginTop : -_h
																								+ 'px'
																					},
																					500,
																					function() { //通过取负margin值,隐藏第一行
																						_field
																								.css(
																										'marginTop',
																										0)
																								.appendTo(
																										_wrap); //隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
																					})
																});
											});
										</script>
										<div style="text-align: left; clear: both">
											<div id="wrapper">

												<div class="first">
													<dl id="ticker-1">

														<dd>广州城市职业学院计算机协会，欢迎您！</dd>
														<dd>广州城市职业学院计算机协会，欢迎您！</dd>
														<dd>广州城市职业学院计算机协会，欢迎您！</dd>
														<dd>广州城市职业学院计算机协会，欢迎您！</dd>
														<dd>广州城市职业学院计算机协会，欢迎您！</dd>
													</dl>
												</div>

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
					<div id="frame8UUuhM" class="frame move-span cl frame-1-1-1">
						<div id="frame8UUuhM_left" class="column frame-1-1-1-l">
							<div id="frame8UUuhM_left_temp" class="move-span temp"></div>

							<!-- 图片轮播区 -->
							<div id="demo1" class="slideBox">
								<ul class="items">
									<li><a href="#" title="这里是测试标题一"><img width="310"
											height="267" src="<%=basePath%>DynamicPhoto/img/1.jpg"></a></li>
									<li><a href="#" title="这里是测试标题二"><img width="310"
											height="267" src="<%=basePath%>DynamicPhoto/img/2.jpg"></a></li>
									<li><a href="#" title="这里是测试标题三"><img width="310"
											height="267" src="<%=basePath%>DynamicPhoto/img/3.jpg"></a></li>
									<li><a href="#" title="这里是测试标题四"><img width="310"
											height="267" src="<%=basePath%>DynamicPhoto/img/4.jpg"></a></li>
									<li><a href="#" title="这里是测试标题五"><img width="310"
											height="267" src="<%=basePath%>DynamicPhoto/img/5.jpg"></a></li>
								</ul>
							</div>
							<!--  -->

							<div id="portal_block_224" class="xbs_1 block move-span">

								<div style="" class="blocktitle title">
									<span style="COLOR: #ff0000" class="titletext">历届干部</span><span
										style="FLOAT: right" class="subtitle"><a
										style="COLOR: #ff0000" href="<%=basePath %>CadreDisplay/cadre_index.jsp" target="_blank">所有&gt;&gt;</a></span>
								</div>
								<div id="portal_block_224_content" class="dxb_bc">
									<style type="text/css">
<!--
.news_box_1 {
	height: 270px;
	width: 300px;
}
-->
</style>
									<div class="news_box_1">
										<table width="290" height="96" border="0" cellpadding="0"
											cellspacing="0">
											<tbody>
												<tr>
													<td width="110" rowspan="2" valign="top"><a href="#"
														target="_blank"><img
															src="<%=basePath%>CadreDisplay/unknown.jpg" width="98"
															height="80" alt="第2013届干部风采"></a></td>
													<td height="22" colspan="2" valign="top"><a href="#"
														title="第2013届干部风采" target="_blank"><strong>第2013届干部风采</strong></a></td>
												</tr>
												<tr>
													<td height="71" colspan="2" valign="top">会 长：张梦婷 <br />
														副会长（南北校）：周秋福、梁家豪
													</td>
												</tr>
											</tbody>
										</table>
										<table width="290" height="96" border="0" cellpadding="0"
											cellspacing="0">
											<tbody>
												<tr>
													<td width="110" rowspan="2" valign="top"><a href="#"
														target="_blank"><img
															src="<%=basePath%>CadreDisplay/unknown.jpg" width="98"
															height="80" alt="第2012届干部风"></a></td>
													<td height="22" colspan="2" valign="top"><a href="#"
														title="第2012届干部风" target="_blank"><strong>第2012届干部风采</strong></a></td>
												</tr>
												<tr>
													<td height="71" colspan="2" valign="top">会 长：<br />副会长（南北校）：
													</td>
												</tr>
											</tbody>
										</table>
										<table width="290" height="96" border="0" cellpadding="0"
											cellspacing="0">
											<tbody>
												<tr>
													<td width="110" rowspan="2" valign="top"><a href="#"
														target="_blank"><img
															src="<%=basePath%>CadreDisplay/unknown.jpg" width="98"
															height="80" alt="第2011届干部风"></a></td>
													<td height="22" colspan="2" valign="top"><a href="#"
														title="第2011届干部风" target="_blank"><strong>第2011届干部风采</strong></a></td>
												</tr>
												<tr>
													<td height="71" colspan="2" valign="top">资料暂无</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						

						<div id="frame8UUuhM_center" class="column frame-1-1-1-c">
							<div id="frame8UUuhM_center_temp" class="move-span temp"></div>
							<div id="portal_block_166" class="xbs_1 block move-span">
								<div class="blocktitle title">
									<span
										style="float:; margin-left: px; font-size:; color: #FF0000;"
										class="titletext">新闻动态</span><span class="subtitle"
										style="float: right; margin-right: px; font-size:"> 
										<a id="a_dn_more" href="<%=basePath %>pagingAction.action?number=600" target="_blank"
										style="color: #999999;">More..</a></span>
								</div>

							</div>
							<!-- 一共13个新闻 -->
							
							<div id="portal_block_223" class="block move-span">
								<div id="portal_block_223_content" class="dxb_bc">
									<div style="height: 10px"></div>
									<div class="module cl xl xl1">
										<ul>
												<%
												 
							     						for(int j=1;j<14;j++){							
												%>
											<div>
												
												· <a  href="<%=basePath %><%=htmlPath_600[j] %>" title="<%=title_600[j] %>"
													target="_blank"><%=title_600[j] %></a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
												<%} %>

											

										</ul>
									</div>
								</div>
							</div>
							<div id="portal_block_189" class="xbs_1 block move-span">
								<div class="blocktitle title">
									<span style="COLOR: #ff0000" class="titletext">机构设置</span>
								</div>
								<div id="portal_block_189_content" class="dxb_bc">
									<div style="height: 10px"></div>
									<div class="module cl xl xl1">
										<ul>
											<div>
												· <a href="<%=basePath %>Organization/secretary.html" title="计算机协会秘书部简介"
													target="_blank">计算机协会秘书部简介</a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
											<div>
												· <a href="<%=basePath %>Organization/technology.html" title="计算机协会技术部简介"
													target="_blank">计算机协会技术部简介</a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
											<div>
												· <a href="<%=basePath %>Organization/group120.html" title="计算机协会120小组简介"
													target="_blank">计算机协会120小组简介</a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
											<div>
												· <a href="<%=basePath %>Organization/publicity.html" title="计算机协会宣传部简介"
													target="_blank">计算机协会宣传部简介</a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
											<div>
												· <a href="<%=basePath %>Organization/public_relations.html"
													title="计算机协会外联部简介" target="_blank">计算机协会外联部简介</a>
											</div>
											<table width="208" border="0" cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<td width="5" height="7"></td>
													</tr>
												</tbody>
											</table>
										</ul>
									</div>
								</div>
							</div>
						</div>

						

						<div id="frame8UUuhM_right" class="column frame-1-1-1-r">
							<div id="frame8UUuhM_right_temp" class="move-span temp"></div>
							<div id="frame7EQ4k6" class="frame move-span cl frame-1">
								<div id="frame7EQ4k6_left" class="column frame-1-c">
									<div id="frame7EQ4k6_left_temp" class="move-span temp"></div>
									<div id="portal_block_165" class="xbs_1 block move-span">
										<div class="blocktitle title">
											<span style="COLOR: #ff0000" class="titletext">通知公告</span><span
												style="FLOAT: right" class="subtitle"> 
												<a style="COLOR: #999999" href="<%=basePath %>pagingAction.action?number=610"
												target="_blank">More..</a></span>
										</div>
										<div id="portal_block_165_content" class="dxb_bc">
											<div style="height: 10px"></div>
											<div class="module cl xl xl1">
												<ul>
													<!-- 一共展示五个标题,动态显示标题-->
													<%
															for(int j=1;j<6;j++){	
																
													%>
													<div>
														
														<em><%=date_610[j]%></em> · <a 
															href="<%=basePath %><%=htmlPath_610[j] %>" title="<%=title_610[j] %>" target="_blank"><%=title_610[j] %></a>
													</div>
													<table width="208" border="0" cellpadding="0"
														cellspacing="0">
														<tbody>
															<tr>
																<td width="5" height="7"></td>
															</tr>
														</tbody>
													</table>
														<%} %>
													

												</ul>
											</div>
										</div>
									</div>
									<!-- 通知公告区结束 -->

									<div id="portal_block_249" class="xbs_1 block move-span">
										<div class="blocktitle title">
											<span style="COLOR: #ff0000" class="titletext">技术交流</span><span
												style="FLOAT: right" class="subtitle"> 

												<a  style="COLOR: #999999" href="<%=basePath %>pagingAction.action?number=620"
												target="_blank">More..</a></span>
										</div>
										<div id="portal_block_249_content" class="dxb_bc">
											<div class="module cl xl">
												<ul>
												<%
													for(int j=1;j<12;j++){ 
													%>
													<li><a href="<%=basePath %><%=htmlPath_620[j] %>"
														title="<%=title_620[j] %>" target="_blank"><%=title_620[j] %></a></li>
														<%} %>
												</ul>
											</div>
										</div>
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
									<div class="module cl ml">
										<ul>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-12000-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/3ab8e7a2947abe0dafd1278ac5a1fc9b.jpg"
													width="146" height="110" alt="cpu最新排行榜"></a>
												<p>
													<a href="http://www.czzyca.com/thread-12000-1-1.html"
														title="cpu最新排行榜" target="_blank">cpu最新排行榜</a>
												</p></li>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-11981-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/13ba0cdef2be7ab02e5a256e318dcc1c.jpg"
													width="146" height="110"
													alt="安装篇---3---Windows Server 2012 R2证书服务ADCS"></a>
												<p>
													<a href="http://www.czzyca.com/thread-11981-1-1.html"
														title="安装篇---3---Windows Server 2012 R2证书服务ADCS"
														target="_blank">安装篇---3---Windows Server 2012 R2证书服</a>
												</p></li>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-11974-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/1906d9a749072dd1ac9cc9b523865dc4.jpg"
													width="146" height="110" alt="移动显卡最新天梯图"></a>
												<p>
													<a href="http://www.czzyca.com/thread-11974-1-1.html"
														title="移动显卡最新天梯图" target="_blank">移动显卡最新天梯图</a>
												</p></li>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-11973-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/f860560f08a4804fe721b2b9798bc9f1.jpg"
													width="146" height="110" alt="安装篇----SQL Server数据库"></a>
												<p>
													<a href="http://www.czzyca.com/thread-11973-1-1.html"
														title="安装篇----SQL Server数据库" target="_blank">安装篇----SQL
														Server数据库</a>
												</p></li>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-11972-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/aff2383f1ac56e0b0151ab5ebab733ac.jpg"
													width="146" height="110" alt="天梯图"></a>
												<p>
													<a href="http://www.czzyca.com/thread-11972-1-1.html"
														title="天梯图" target="_blank">天梯图</a>
												</p></li>
											<li style="width: 146px;"><a
												href="http://www.czzyca.com/thread-11970-1-1.html"
												target="_blank"><img
													src="gcp_computerAssociation_files/fc61c7a57266b56555cd8d4986a84b00.jpg"
													width="146" height="110" alt="大厨城电信的网络，我可以吐槽吗？！"></a>
												<p>
													<a href="http://www.czzyca.com/thread-11970-1-1.html"
														title="大厨城电信的网络，我可以吐槽吗？！" target="_blank">大厨城电信的网络，我可以吐槽吗？！</a>
												</p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="framePky1Eb" class="frame move-span cl frame-1">


						<div id="framePky1Eb" class="frame move-span cl frame-1">
							<div class="title frame-title">
								<span class="titletext">友情连接</span>
							</div>

							<div id="portal_block_216" class="block move-span">
								<div id="portal_block_216_content" class="dxb_bc">
									<div class="portal_block_summary">
										
										<div class="bn lk" style="text-align: center;">
											<p>
												<a href="http://www.gcp.edu.cn/">广州城市职业学院</a> &nbsp;&nbsp;
												&nbsp; &nbsp;&nbsp; &nbsp; <a id="rear_entrance"
													href="<%=basePath %>rear/rearAdmin.jsp" >后台入口</a>
											</p>
											<br />

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--[/diy]-->
			</div>
		</div>
		<div id="ft" class="wp cl">

			<div id="frt">
				<p style="text-align: center;">最终解释权归广州城市职业学院计算机协会所有</p>
			</div>
		</div>
</body>
</html>
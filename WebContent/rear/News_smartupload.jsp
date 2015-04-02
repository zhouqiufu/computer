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

<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

	<%
		//设置request范围字符集
		request.setCharacterEncoding("UTF-8");
		String newsTitle = request.getParameter("newsTitle");
		String newsAuthor = request.getParameter("newsAuthor");
		String newsPhotographer = request.getParameter("newsPhotographer");
		String newsSummary = request.getParameter("newsSummary");
		String news_content = request.getParameter("news_content");

		//持久化代码

		DynamicNewsArea dynamicNewsArea = new DynamicNewsArea();

		// 模拟赋值
		Date common_date = new Date();
		// 输出年月日
		DateFormat short_date = DateFormat.getDateInstance();

		// 输出完整的年月日时分秒
		DateFormat full_Time = DateFormat.getDateTimeInstance(
				DateFormat.MEDIUM, DateFormat.MEDIUM);

		dynamicNewsArea.setFullTime(full_Time.format(common_date));
		dynamicNewsArea.setNewsAuthor(newsAuthor);
		dynamicNewsArea.setNewsContent(news_content);
		dynamicNewsArea.setNewsTitle(newsTitle);
		dynamicNewsArea.setNewsId(full_Time.format(common_date)
				+ dynamicNewsArea.getNewsTitle());
		dynamicNewsArea.setNewsDate(short_date.format(common_date));
		dynamicNewsArea.setNewsPhotographer(newsPhotographer);
		dynamicNewsArea.setNewsSummary(newsSummary);
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"beans.xml");
		DynamicNewsAreaService dynamicNewsAreaService = (DynamicNewsAreaService) appContext
				.getBean("dynamicNewsAreaService");

		// 添加
		dynamicNewsAreaService.save(dynamicNewsArea);

		response.sendRedirect(basePath + "rear/buildhtml_NewsBrowse.jsp");

		session.setAttribute("title", newsTitle);
	%>


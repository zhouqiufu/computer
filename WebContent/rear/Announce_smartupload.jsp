<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,java.io.*,java.sql.*,com.AnnounceArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.AnnounceArea.service.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*"%>

<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	//设置request范围字符集
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%

	String announceTitle = request.getParameter("announceTitle");
	String announceAuthor = request.getParameter("announceAuthor");
	String news_content = request.getParameter("news_content");
	System.out.println(announceTitle+announceAuthor+news_content);
	//持久化代码

	AnnounceDomain announceDomain = new AnnounceDomain();

	// 模拟赋值
	Date common_date = new Date();
	// 输出年月日
	DateFormat short_date = DateFormat.getDateInstance();

	// 输出完整的年月日时分秒
	DateFormat full_Time = DateFormat.getDateTimeInstance(
			DateFormat.MEDIUM, DateFormat.MEDIUM);

	announceDomain.setFullTime(full_Time.format(common_date));
	announceDomain.setAnnounceAuthor(announceAuthor);
	announceDomain.setAnnounceContent(news_content);
	announceDomain.setAnnounceTitle(announceTitle);
	announceDomain.setAnnounceId(full_Time.format(common_date)
			+ announceDomain.getAnnounceTitle());
	//dynamicNewsArea.setHtml_path(null);
	announceDomain.setNewsDate(short_date.format(common_date));

	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	announceService announceService = (announceService) appContext
			.getBean("announceService");

	// 添加
	announceService.add(announceDomain);

	response.sendRedirect(basePath
			+ "rear/buildhtml_AnnounceBrowse.jsp");

	request.getSession().setAttribute("title", announceTitle);
%>

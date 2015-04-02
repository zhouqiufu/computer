<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,java.io.*,java.sql.*,com.TechnologyArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.TechnologyArea.service.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*"%>

<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>

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
	String technology_content = request.getParameter("technology_content");
	String technologyTitle = request.getParameter("technologyTitle");
	String technologyAuthor = request.getParameter("technologyAuthor");
	String technologyPhotographer = request.getParameter("technologyPhotographer");
	String technologySummary = request.getParameter("technologySummary");

	
			//持久化代码

			TechnologyArea technologyArea = new TechnologyArea();

			// 赋值
			Date common_date = new Date();
			// 输出年月日
			DateFormat short_date = DateFormat.getDateInstance();

			// 输出完整的年月日时分秒
			DateFormat full_Time = DateFormat.getDateTimeInstance(
			DateFormat.MEDIUM, DateFormat.MEDIUM);

			technologyArea.setFullTime(full_Time.format(common_date));
			technologyArea.setTechnologyAuthor(technologyAuthor);
			technologyArea.setTechnologyContent(technology_content);
			technologyArea.setTechnologyTitle(technologyTitle);
			technologyArea.setTechnologyId(full_Time.format(common_date)
			+ technologyArea.getTechnologyTitle());
			//dynamicNewsArea.setHtml_path(null);
			technologyArea.setTechnologyDate(short_date.format(common_date));
			technologyArea.setTechnologyPhotographer(technologyPhotographer);
			technologyArea.setTechnologySummary(technologySummary);
			

			ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
			TechnologyAreaService technologyAreaService = (TechnologyAreaService) appContext
			.getBean("technologyAreaService");

			// 添加
			technologyAreaService.save(technologyArea);

			response.sendRedirect(basePath+"rear/buildhtml_TechnologyArticleBrowse.jsp");
	
		
		request.getSession().setAttribute("title", technologyTitle);
	%>

	

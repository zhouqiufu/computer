<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*,java.sql.*,com.AnnounceArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>

<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.AnnounceArea.service.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.*,java.text.*"%>

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
	
		//取得整个web应用的物理根路径（注意不是jsp项目根路径）
		String root = request.getSession().getServletContext()
	.getRealPath("/");
	
		String title  = request.getParameter("news_title");
		//System.out.println(title);
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
							"beans.xml");
							announceService announceService = (announceService) appContext
							.getBean("announceService");
							
		List<AnnounceDomain> list = announceService.getAnnounceByTitle(title);
				AnnounceDomain announceDomain = list.iterator().next();
		String htmlPath = root + "html\\" + announceDomain.getHtmlName();
		String imagePath = root + "image\\" + announceDomain.getPhotoName();
		
		//删除图片
		File delete_NewsPhoto = new File(imagePath);
		delete_NewsPhoto.delete();
 
		//删除静态网页
		File delete_NewsHTML = new File(htmlPath);
		delete_NewsHTML.delete();
		
		boolean isOk = announceService.deleteAnnounce(title);
%>
<%-- <%=title %> --%>
<%=isOk%>
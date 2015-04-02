<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*,java.sql.*,com.TechnologyArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>

<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.TechnologyArea.service.*"%>

<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>

<%@ page import="java.io.File"%>


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
			TechnologyAreaService technologyAreaService = (TechnologyAreaService) appContext
			.getBean("technologyAreaService");
			
		List<TechnologyArea> list = technologyAreaService.getAllTitle();
		TechnologyArea technologyArea = list.iterator().next();
		String htmlPath = root + "html\\" + technologyArea.getHtmlName();
		String imagePath = root + "image\\" + technologyArea.getPhotoName();
		
		//删除图片
		File delete_NewsPhoto = new File(imagePath);
		delete_NewsPhoto.delete();

		//删除静态网页
		File delete_NewsHTML = new File(htmlPath);
		delete_NewsHTML.delete();
		
		boolean isOk = technologyAreaService.deleteTechnologyArticle(title);
		 
	%>
	<%-- <%=title %> --%>
	<%=isOk%>
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
		DynamicNewsAreaService dynamicNewsAreaService = (DynamicNewsAreaService) appContext
		.getBean("dynamicNewsAreaService");
		List<DynamicNewsArea> list = dynamicNewsAreaService.getNewsByTitle(title);
		DynamicNewsArea dynamicNewsArea = list.iterator().next();
		String htmlPath = root + "html\\" + dynamicNewsArea.getHtmlName();
		String imagePath = root + "image\\" + dynamicNewsArea.getPhotoName();
		
		//删除图片
		File delete_NewsPhoto = new File(imagePath);
		delete_NewsPhoto.delete();

		//删除静态网页
		File delete_NewsHTML = new File(htmlPath);
		delete_NewsHTML.delete();
		
		boolean isOk = dynamicNewsAreaService.deleteNews(title);
		 
	%>
	<%-- <%=title %> --%>
	<%=isOk%>
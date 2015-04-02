<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*,java.sql.*,com.DynamicNewsArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>

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
		request.setCharacterEncoding("GBK");
		
		String title_600 = (String)session.getAttribute("title");
		
		String StaticHtmlName = null;
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
		"beans.xml");
		DynamicNewsAreaService dynamicNewsAreaService = (DynamicNewsAreaService) appContext
		.getBean("dynamicNewsAreaService");

		List<DynamicNewsArea> list = dynamicNewsAreaService.getNewsByTitle(title_600);
		
		
		Iterator iterator = list.iterator();
		DynamicNewsArea dynamicNewsArea = (DynamicNewsArea) iterator.next();

		String newsTitle = dynamicNewsArea.getNewsTitle();
		
		String newsContent = dynamicNewsArea.getNewsContent();
		String fullTime = dynamicNewsArea.getFullTime();// 年月日时分秒
		
		String newsAuthor = dynamicNewsArea.getNewsAuthor();// 新闻作者
		
		String newsPhotographer = dynamicNewsArea.getNewsPhotographer();// 照片拍摄者
		String newsSummary = dynamicNewsArea.getNewsSummary();
		
		try {

			String filePath = "";
			//读取模板htm文件的路径
			filePath = request.getRealPath("/") + "rear/BrowseNews.htm";

			String templateContent = "";

			FileInputStream fileinputstream = new FileInputStream(filePath);//读取模块文件

			int lenght = fileinputstream.available();

			byte bytes[] = new byte[lenght];

			fileinputstream.read(bytes);

			fileinputstream.close();

			templateContent = new String(bytes);

			//给模板htm文件赋值
			templateContent = templateContent.replaceAll("###newsTitle###",
			newsTitle);
			templateContent = templateContent.replaceAll(
			"###newsContent###", newsContent);
			templateContent = templateContent.replaceAll("###fullTime###",
			fullTime);
			templateContent = templateContent.replaceAll(
			"###newsAuthor###", newsAuthor);
			templateContent = templateContent.replaceAll(
			"###newsPhotographer###", newsPhotographer);
			templateContent = templateContent.replaceAll(
			"###newsSummary###", newsSummary);
		

			// 根据时间得文件名
			Calendar calendar = Calendar.getInstance();
			String fileame = "600"
			+ String.valueOf(calendar.getTimeInMillis()) + ".html";//
			StaticHtmlName = fileame;//找到生成的静态html
			//System.out.println("JSP转换成HTML之后的文件名：     " + fileame);

			fileame = request.getRealPath("/") + "html/" + fileame;//生成的html文件保存路径

			//System.out.println("JSP转换成HTML之后的文件保存路径：     " + fileame);

			FileOutputStream fileoutputstream = new FileOutputStream(
			fileame);//建立文件输出流

			byte tag_bytes[] = templateContent.getBytes();
			fileoutputstream.write(tag_bytes);
			fileoutputstream.close();
			System.out.println("Success");
		} catch (Exception e) {
			out.print(e.toString());
		}
	%>

	<%
		String htmlPath_600 = "html/" + StaticHtmlName;
			//System.out.println(htmlPath);
			//将新生成的静态网页的路径存进数据库中
			dynamicNewsAreaService.saveHtmlInfo(title_600, htmlPath_600, StaticHtmlName);
			//response.sendRedirect(htmlPath_600);//跳转到静态新闻页面
	%>


	<%="ok" %>


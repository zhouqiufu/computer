<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*,java.sql.*,com.TechnologyArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>

<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.TechnologyArea.service.*"%>

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
		request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String title_620 = (String)request.getSession().getAttribute("title");
			String StaticHtmlName = null;
			ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
			TechnologyAreaService technologyAreaService = (TechnologyAreaService) appContext
			.getBean("technologyAreaService");

			List<TechnologyArea> list = technologyAreaService.getTechnologyByTitle(title_620);
			
			Iterator iterator = list.iterator();
			TechnologyArea technologyArea = (TechnologyArea) iterator.next();

			String technologyTitle = technologyArea.getTechnologyTitle();
			String technologyContent = technologyArea.getTechnologyContent();
			String fullTime = technologyArea.getFullTime();// 年月日时分秒

			String technologyAuthor = technologyArea.getTechnologyAuthor();//作者
			String technologyPhotographer = technologyArea.getTechnologyPhotographer();// 照片拍摄者
			String technologySummary = technologyArea.getTechnologySummary();
			
		
			
			try {

		String filePath = "";
		//读取模板htm文件的路径
		filePath = request.getRealPath("/") + "rear/BrowseTechnologyArticle.htm";

		String templateContent = "";

		FileInputStream fileinputstream = new FileInputStream(filePath);//读取模块文件

		int lenght = fileinputstream.available();

		byte bytes[] = new byte[lenght];

		fileinputstream.read(bytes);

		fileinputstream.close();

		templateContent = new String(bytes);

		//给模板htm文件赋值
		templateContent = templateContent.replaceAll("###technologyTitle###",
				technologyTitle);
		templateContent = templateContent.replaceAll(
		"###technologyContent###", technologyContent);
		templateContent = templateContent.replaceAll("###fullTime###",
		fullTime);
		templateContent = templateContent.replaceAll(
		"###technologyAuthor###", technologyAuthor);
		templateContent = templateContent.replaceAll(
		"###technologyPhotographer###",technologyPhotographer);
		templateContent = templateContent.replaceAll(
		"###technologySummary###", technologySummary);
		

		// 根据时间得文件名
		Calendar calendar = Calendar.getInstance();
		String fileame = "620"
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
			} catch (Exception e) {
		out.print(e.toString());
			}
	%>

	<%
		String htmlPath_620 = "html/" + StaticHtmlName;
		//System.out.println(htmlPath);
		//将新生成的静态网页的路径存进数据库中
		technologyAreaService.saveHtmlInfo(title_620, htmlPath_620, StaticHtmlName);
		//response.sendRedirect(htmlPath_600);//跳转到静态新闻页面
	%>

	

<%="ok"%>
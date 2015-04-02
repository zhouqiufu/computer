<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*,java.sql.*,com.AnnounceArea.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>

<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.AnnounceArea.service.*"%>

<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.Date,java.text.*"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>


<%
	String title_610 = (String)request.getSession().getAttribute("title");
	String StaticHtmlName = null;
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
	"beans.xml");
	announceService announceService = (announceService) appContext
	.getBean("announceService");

	List<AnnounceDomain> list = announceService.getAnnounceByTitle(title_610);
	
	Iterator iterator = list.iterator();
	AnnounceDomain announceDomain = (AnnounceDomain) iterator.next();

	String announceTitle = announceDomain.getAnnounceTitle();
	String announceContent = announceDomain.getAnnounceContent();
	String fullTime = announceDomain.getFullTime();// 年月日时分秒
	String announceAuthor = announceDomain.getAnnounceAuthor();// 新闻作者
		
		
	
	try {

		String filePath = "";
		//读取模板htm文件的路径
		filePath = request.getRealPath("/") + "rear/BrowseAnnounce.htm";

		String templateContent = "";

		FileInputStream fileinputstream = new FileInputStream(filePath);//读取模块文件

		int lenght = fileinputstream.available();

		byte bytes[] = new byte[lenght];

		fileinputstream.read(bytes);

		fileinputstream.close();

		templateContent = new String(bytes);

		//给模板htm文件赋值
		templateContent = templateContent.replaceAll("###announceTitle###",
		announceTitle);
		templateContent = templateContent.replaceAll(
		"###announceContent###", announceContent);
		templateContent = templateContent.replaceAll("###fullTime###",
		fullTime);
		templateContent = templateContent.replaceAll(
		"###announceAuthor###", announceAuthor);
		
		// 根据时间得文件名
		Calendar calendar = Calendar.getInstance();
		String fileame = "610"
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
		%>
		<%="false"%>
		<%
	}
%>

<%
	String htmlPath_610 = "html/" + StaticHtmlName;
		//System.out.println(htmlPath);
		//将新生成的静态网页的路径存进数据库中
		announceService.saveHtmlInfo(title_610, htmlPath_610, StaticHtmlName);
		//response.sendRedirect(htmlPath_600);//跳转到静态新闻页面
%>
<%="ok"%>


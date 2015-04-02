<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,java.io.*,java.sql.*,com.uploadphoto.domain.*,java.net.*,com.opensymphony.xwork2.util.*,com.opensymphony.xwork2.*,javax.servlet.*"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*,com.uploadphoto.service.UploadPhotoService"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<!-- SmartUpload组件用到的文件上传类 -->
	<%
		//设置request范围字符集
		request.setCharacterEncoding("UTF-8");
	    PrintWriter out_write =  response.getWriter();
		String title_session = null;

		//取得整个web应用的物理根路径（注意不是jsp项目根路径）
		String root = request.getSession().getServletContext()
		.getRealPath("/");

		//设置上传文件的保存路径
		String savePath = root + "image\\";

		//声明SmartUpload类对象
		SmartUpload mySmartUpload = new SmartUpload();

		try {

			//初始化的方法必须先执行

			//参数：config,request,response都是jsp内置对象
			mySmartUpload.initialize(config, request, response);

			//上传文件数据
			mySmartUpload.upload();

			//将全部上传文件保存到指定目录下
			mySmartUpload.save(savePath);

			//取得文件名(因为只上传一个文件，所以用getFile(0))
			String fileName = mySmartUpload.getFiles().getFile(0)
			.getFileName();

			//因为表单使用了enctype="multipart/form-data"，所以得使用这种方法获取request
			Request r = mySmartUpload.getRequest();

			//取得表单中普通控件的值
			String photo_explain = r.getParameter("photo_explain");

			

		

			//持久化代码

			UploadPhoto uploadPhoto = new UploadPhoto();

			// 模拟赋值
			Date common_date = new Date();
			// 输出年月日
			DateFormat short_date = DateFormat.getDateInstance();

			// 输出完整的年月日时分秒
			DateFormat full_Time = DateFormat.getDateTimeInstance(
			DateFormat.MEDIUM, DateFormat.MEDIUM);

			uploadPhoto.setFullTime(full_Time.format(common_date));
			uploadPhoto.setPhotoName(fileName);
			uploadPhoto.setPhotoPath("image/"+fileName);
			uploadPhoto.setPhotoExplain(photo_explain);
			

			ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
			UploadPhotoService uploadPhotoService = (UploadPhotoService) appContext
			.getBean("uploadPhotoService");

			// 添加
			uploadPhotoService.add(uploadPhoto);
			out_write.println("<script type='text/javascript'>alert('上传图片成功！跳转到后台管理页面');</script>");
			out_write.println("<script type='text/javascript'>"+"window.location.href='"+basePath+"rear/rearAdmin.jsp'</script>");
			
						
		} catch (Exception e) {
			out_write.print("<script type='text/javascript'>alert('上传图片失败！返回图片上传页面');</script>");
			out_write.println("<script type='text/javascript'>"+"window.location.href='"+basePath+"rear/UploadPhoto.jsp'</script>");
		}
	%>

	

</body>
</html>
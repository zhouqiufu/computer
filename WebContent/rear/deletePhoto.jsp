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
<%@ page import="java.io.File"%>
<%@ page
	import="org.springframework.context.*,org.springframework.context.support.*"%>
<%@ page
	import="com.jspsmart.upload.*,java.sql.*,java.util.*,java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%@ taglib prefix="s" uri="/struts-tags"%>


<%
	try{
	//设置request范围字符集
	request.setCharacterEncoding("UTF-8");
	String photoName = request.getParameter("photoName");

	//取得整个web应用的物理根路径（注意不是jsp项目根路径）
	String root = request.getSession().getServletContext()
			.getRealPath("/");

	String imagePath = root + "image\\" + photoName;

	//删除图片
	File delete_NewsPhoto = new File(imagePath);
	delete_NewsPhoto.delete();

	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");

	UploadPhotoService uploadPhotoService = (UploadPhotoService) appContext
			.getBean("uploadPhotoService");
	uploadPhotoService
			.deletePhotoRecordByPhotoName(photoName);
	%>
	<%="ok" %>
	<%
	}catch(Exception e){
		%>
		<%="图片删除失败！         "+e %>
		<%
	}
%>



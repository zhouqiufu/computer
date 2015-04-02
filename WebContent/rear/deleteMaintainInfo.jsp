<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.mail.*, javax.mail.internet.*,javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.maintain.service.MaintainService,com.maintain.domain.Maintain,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%
	request.setCharacterEncoding("UTF-8");
	//姓名
	String name = request.getParameter("name");
	String dateTime = request.getParameter("dateTime");
	
%>
	
<%
	try{
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	MaintainService maintainService = (MaintainService) appContext
			.getBean("maintainService");
	maintainService.deleteMessage(name, dateTime);
	%>
	<%="true" %>
	
	<%
	
	}catch(Exception e){
		%>
		<%="false" %>
		
		<%
	}
%>





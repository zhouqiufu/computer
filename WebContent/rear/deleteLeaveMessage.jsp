<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.leaveMessage.domain.LeaveMessage,com.leaveMessage.service.LeaveMessageService,org.springframework.context.support.ClassPathXmlApplicationContext"%>


<%
	try{
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String dateTime = request.getParameter("dateTime");
	
	System.out.println(name+dateTime);
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	LeaveMessageService leaveMessageService = (LeaveMessageService) appContext
			.getBean("leaveMessageService");
	leaveMessageService.deleteMessage(name, dateTime);
	%>
	<%="true" %>
	<%
	}catch(Exception e){
		
		%>
		<%="false" %>
		<%
	}	
	
%>

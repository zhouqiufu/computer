<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page
	import="com.recordUserNumber.domain.RecordUserNumber,com.recordUserNumber.service.RecordUserNumberService"%>


<%
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	RecordUserNumberService recordUserNumberService = (RecordUserNumberService) appContext
			.getBean("recordUserNumberService");

	int number_all = recordUserNumberService.getTotalResult();
%>
<%=number_all%>

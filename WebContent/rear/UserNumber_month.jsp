<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page
	import="com.recordUserNumber.domain.RecordUserNumber,com.recordUserNumber.service.RecordUserNumberService"%>
<%
	String month = request.getParameter("month");
	String year = request.getParameter("year");
%>

<%
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	RecordUserNumberService recordUserNumberService = (RecordUserNumberService) appContext
			.getBean("recordUserNumberService");

	int number_month = recordUserNumberService.getMonthTotalResult(
			month, year);
%>
<%=number_month%>

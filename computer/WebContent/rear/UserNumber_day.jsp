<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,org.springframework.context.ApplicationContext,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page
	import="com.recordUserNumber.domain.RecordUserNumber,com.recordUserNumber.service.RecordUserNumberService"%>
<%
	String day = request.getParameter("day");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	System.out.println(year+month+day);
%>

<%
	ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	RecordUserNumberService recordUserNumberService = (RecordUserNumberService) appContext
			.getBean("recordUserNumberService");

	int number_day = recordUserNumberService.getDayTotalResult(day, month, year);
%>
<%=number_day%>

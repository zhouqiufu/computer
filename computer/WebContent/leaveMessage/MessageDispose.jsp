<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.leaveMessage.domain.LeaveMessage,com.leaveMessage.service.LeaveMessageService,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%
	String name = request.getParameter("_name");
	String mail = request.getParameter("_mail");
	String tel = request.getParameter("_tel");
	String text = request.getParameter("_text");
	String checkcode = request.getParameter("_code");
	//
	if (checkcode.equals("") || checkcode == null) {
		//out.print("<script>alert('请输入验证码');</script>");
		%>
		<%="fail"%>
		<%
	} else {
		if (!checkcode.equalsIgnoreCase((String) session
				.getAttribute("rand_leaveMessage"))) {
			//out.print("<script>alert('验证码不正确,请重新输入');history.back(-1);</script>");
			%>
			<%="fail"%>
			<%
		} else {
			//out.print("登录成功");
			try{
			//
			Date common_date = new Date();
			// 输出年月日
			DateFormat short_date = DateFormat.getDateInstance();

			// 输出完整的年月日时分秒
			DateFormat full_Time = DateFormat.getDateTimeInstance(
					DateFormat.MEDIUM, DateFormat.MEDIUM);

			LeaveMessage leaveMessage = new LeaveMessage();
			leaveMessage.setName(name);
			leaveMessage.setText(text);
			leaveMessage.setDateTime(full_Time.format(common_date));
			leaveMessage.setMail(mail);
			leaveMessage.setTel(tel);
			ApplicationContext appContext = new ClassPathXmlApplicationContext(
					"beans.xml");
			LeaveMessageService leaveMessageService = (LeaveMessageService) appContext
					.getBean("leaveMessageService");
			leaveMessageService.add(leaveMessage);
			}catch(Exception e){
				
				%>
				<%="fail"%>
				<%
			}
		}
	}

	
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.leaveMessage.domain.LeaveMessage,com.leaveMessage.service.LeaveMessageService,org.springframework.context.support.ClassPathXmlApplicationContext"%>
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
<title>管理留言版块</title>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");
	LeaveMessageService leaveMessageService = (LeaveMessageService) appContext
			.getBean("leaveMessageService");
	List<LeaveMessage>  list = leaveMessageService.getAllMessages();
	Iterator<LeaveMessage> iterator = list.iterator();
	%>
	<div>
		<table border="solid " border-color="#03C" style="text-align: center;">
			<tr>
				<td>&nbsp;&nbsp;姓名&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;邮箱&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;电话&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;内容&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;时间&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;操作&nbsp;&nbsp;</td>
			</tr>
			<%
				int i = 0;
				while(iterator.hasNext()){
				i++;
				LeaveMessage leaveMessage =	iterator.next();
				String tel = leaveMessage.getTel() ;
				String phone = "";
				if(tel.equals("请输入您的电话")){
					phone = "无";
				}else{phone = tel;}
				
				String mail_ = leaveMessage.getMail();
				String mail = "";
				if(mail_.equals("请输入您的邮箱")){
					mail = "无";
					
				}else{
					
					mail = mail_;
				}
			%>
			
			<tr>
			<script type="text/javascript">
			function del(num){
				
			
			$.post('deleteLeaveMessage.jsp',{name:$("#name_"+num).val(),dateTime:$("#dateTime_"+num).val()},function(data){
					if($.trim(data)=="true"){
						$("#btn_del_"+num).css('color','red');
						$("#btn_del_"+num).val("已删除");
						$("#btn_del_"+num).attr( "disabled","disabled" );
					}
					
					
				}); 
				
			}

			</script>
				<td>&nbsp;&nbsp;<input id="name_<%=i %>" type="text" value="<%=leaveMessage.getName()%>" maxlength="7"/>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<%=mail %>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<%=phone %>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<textarea cols="40" rows="3"><%=leaveMessage.getText()%></textarea>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text" id="dateTime_<%=i %>" value="<%=leaveMessage.getDateTime()%> " maxlength="10"/>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="button" id="btn_del_<%=i %>" onclick="del(<%=i %>)" value="删除"/>&nbsp;&nbsp;</td>
			</tr>


			<%
				}
			%>
		</table>
	</div>
</body>
</html>
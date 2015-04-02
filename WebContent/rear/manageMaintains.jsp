<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.mail.*, javax.mail.internet.*,javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.maintain.service.MaintainService,com.maintain.domain.Maintain,org.springframework.context.support.ClassPathXmlApplicationContext"%>
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
<title>管理网上报修版块</title>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"beans.xml");
		MaintainService maintainService = (MaintainService) appContext
				.getBean("maintainService");
		List<Maintain> list = maintainService.getAllMessages();
		Iterator<Maintain> iterator = list.iterator();
		
	%>
	<div>
		<table border="solid " border-color="#03C" style="text-align: center;">
			<tr>
				<td>&nbsp;&nbsp;姓名&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;手机号码&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;寝室号&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;空闲时间&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;维护类型&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;设备类型&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;软件平台&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;故障现象&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;故障详细描述&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;时间&nbsp;&nbsp;</td>
				<td>操作</td>
				
			</tr>
			<%
				int i = 0;
				while (iterator.hasNext()) {
					i++;
					Maintain maintain = iterator.next();
			%>

			<tr>
				<script type="text/javascript">
				function delMaintain(num){
					//alert($.trim($("#name_"+num).val())+"     "+$.trim($("#date_Time_"+num).val()));
					$.post('deleteMaintainInfo.jsp',{name:$.trim($("#name_"+num).val()),dateTime:$.trim($("#date_Time_"+num).val())},function(data){
						if($.trim(data)=="true"){
							$("#btn_"+num).css('color','red');
							$("#btn_"+num).val("已删除");
							$("#btn_"+num).attr( "disabled","disabled" );
						}
						
					});
				}
				</script>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" id="name_<%=i %>" value="<%=maintain.getName() %>"/>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7"  value="<%=maintain.getPhone() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getAddress() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getFreetime() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getWeihu() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getShebei() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getPingtai() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getGuzhang() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" value="<%=maintain.getContent() %>"/> &nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;<input type="text"  maxlength="7" id="date_Time_<%=i %>" value="<%=maintain.getDateTime() %>"/> &nbsp;&nbsp;</td>
				<td><input type="button" onclick="delMaintain(<%=i %>)" id="btn_<%=i %>" value="删除"/></td>
			</tr>


			<%
				}
			%>
		</table>
	</div>
</body>
</html>
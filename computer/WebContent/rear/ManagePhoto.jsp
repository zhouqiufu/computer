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
<script language="javascript" type="text/javascript" src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>
	
<script type="text/javascript">
		
		function previewFunction(num){
			
			//alert($.trim($("#path_"+num).attr("value")));
			
			var photoPath = "image/"+$.trim($("#photoName_"+num).attr("value"));
			var base_p = $("#base_path").text();
			//alert("<img width='554' height='344'  src="+base_p+photoPath+"/>");
			$("#td_p_"+num).css("display","block");
			//$("#show_photo_"+num)
			$("#show_img_"+num).attr("src",base_p+photoPath);
		}
		
		function deleteFunction(num){
			var photoName = $.trim($("#photoName_"+num).attr("value"));
			
			
			$.post('deletePhoto.jsp',{photoName:photoName},function(data){
				
				//alert($.trim(data));
				if($.trim(data)=="ok"){
					
					$("#btn_del_"+num).attr('disabled',true);
					$("#btn_del_"+num).css('color','red');
					$("#btn_del_"+num).val("已删除");
					$("#btn_preview_"+num).attr('disabled',true);
				}
				
				
			});
			
		}
	</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理上传的照片</title>
</head>
<body style="text-align:center;">
<p>
<span><font color="red" size="+2">管理图片页面</font></span>
</p>
<p id="base_path" style="display:none;"><%=basePath %></p>
	<%
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"beans.xml");

			UploadPhotoService uploadPhotoService = (UploadPhotoService) appContext
			.getBean("uploadPhotoService");
			
			List<UploadPhoto> list_photo = uploadPhotoService.getAllPhotoObject();
			Iterator<UploadPhoto> iterator_photo = list_photo.iterator();
	%>
	<div  style="text-align:center;">
	<table style="text-align:center;"  border="solid " border-color="#03C">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的名称&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的说明&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的引用路径&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的上传时间&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的预览操作&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;图片的删除操作&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<%
			int i = 0;
			while(iterator_photo.hasNext()){
			i++;
			UploadPhoto uploadPhoto = iterator_photo.next();
		%>
		
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="photoName_<%=i %>" type="text" value="<%=uploadPhoto.getPhotoName()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="explain_<%=i %>" type="text" value="<%=uploadPhoto.getPhotoExplain()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="path_<%=i %>" type="text" value="../<%=uploadPhoto.getPhotoPath()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=uploadPhoto.getFullTime()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="previewFunction(<%=i%>)" id="btn_preview_<%=i%>" type="button" value="预览"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="btn_del_<%=i%>" onclick="deleteFunction(<%=i%>)" type="button" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td id="td_p_<%=i %>" style="display:none;">
				<p id="show_photo_<%=i %>">
					<img id="show_img_<%=i %>" width="54" height="34" src=""/>
				</p>
			</td>
			
			
		</tr>
		<%
			}
		%>
	</table>
<br/><br/><a href="<%=basePath%>rear/rearAdmin.jsp">返回后台管理页面</a> 
	</div>

</body>
</html>
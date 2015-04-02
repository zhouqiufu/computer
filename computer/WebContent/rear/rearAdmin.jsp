<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript"
	src="<%=basePath%>html/nb/js/jquery-1.4.2.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计算机协会</title>
</head>
<body>
	<div>
		<p>
			管理新闻动态版区<br /> <a href="<%=basePath%>rear/writeNews.jsp">写新闻</a><br />
			<a href="<%=basePath%>pagingAction.action?number=600">查看新闻</a><br />
			<a href="<%=basePath%>rear/displayNewsTitle.jsp">删除新闻</a>
		</p>

		<p>
			管理协会通知版区<br /> <a href="<%=basePath%>rear/writeAnnounce.jsp">发布通知</a><br />
			<a href="<%=basePath%>pagingAction.action?number=610">查看协会通知</a><br />
			<a href="<%=basePath%>rear/displayAnnounceTitle.jsp">删除通知</a>
		</p>

		<p>
			管理技术交流版区<br /> <a href="<%=basePath%>rear/writeTechnology.jsp">写技术文章</a><br />
			<a href="<%=basePath%>pagingAction.action?number=620">查看技术文章</a><br />
			<a href="<%=basePath%>rear/displayTechnology.jsp">删除技术文章</a>
		</p>

		<p>
			查看首页<br /> <a href="<%=basePath%>">跳转到首页</a><br/>
			
		</p>
		
		
		
		<p>
			图片管理模块<br /> <a href="<%=basePath%>rear/UploadPhoto.jsp">上传图片</a><br/>
			<a href="<%=basePath%>rear/ManagePhoto.jsp">管理上传的图片</a>
		</p>
		
		
		<p>
			管理维修申请版区<br /> <a href="<%=basePath%>rear/manageMaintains.jsp">管理</a><br />
			
		</p>
		
		<p>
			管理留言版区<br /> <a href="<%=basePath%>rear/manageLeaveMessage.jsp">管理</a><br />
			
		</p>

		<p>
		<table style="text-align:center;">
			<tr>
				<td>查看用户浏览量</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>查询结果</td>
			</tr>
			<!-- 按年查询浏览量 -->
			<script type="text/javascript">
			function send_year(){
				
				if(check_year()!=false){
					//alert("验证通过！");
					$.post('UserNumber_year.jsp',{year:$("#year").val()},function(data){
						
						//alert(data);
						$("#show_year").text($.trim(data));
						
					});
				}
			}
			
			function check_year(){
				//alert($("#year").val().length);
				if(!isNaN($("#year").val())){
					if($("#year").val().length!=4){
						alert("年份的长度必须为4   ！");
						return false;
					}
				}else{
					alert("年份必须为数字 ！");
					return false;
				}
			}
			
			</script>
			<tr>
				<td>按年份查询浏览量:&nbsp;</td>
				<td><input type="text" id="year" maxlength="4"/>年&nbsp;</td>
				<td><input onclick="send_year()" type="button" id="btn_look_year" value="查看浏览量" />&nbsp;</td>
				<td><div id="show_year"></div></td>
			</tr>
			
			<!-- 按月份查询 -->
			<script type="text/javascript">
			function send_year_month(){
				if(check_year_month()!=false){
					//alert("pass");
					
					$.post('UserNumber_month.jsp',{year:$("#year_month").val(),month:$("#month").val()},function(data){
						$("#show_month").text($.trim(data));
						
					});
					
				}
				
			}
			
			function check_year_month(){
				//alert($("#year").val().length);
				if(!isNaN($("#year_month").val())){
					if($("#year_month").val().length!=4){
						alert("年份的长度必须为4 ！");
						return false;
					}
				}else{
					alert("年份必须为数字 ！");
					return false;
				}
				
				if(!isNaN($("#month").val())){
					if($("#month").val().length>2||$("#month").val().length<1){
						alert("月份的长度最长为2,最小长度为1 ！");
						return false;
					}
					
					if($("#month").val()>12||$("#month").val()<1){
						alert("月份无效！");
						return false;
					}
				}else{
					alert("月份必须为数字 ！");
					return false;
				}
			}
			
			
			</script>
			<tr>
				<td>按月份查询浏览量:&nbsp;</td>
				<td><input maxlength="4" size="5" type="text" id="year_month" />年&nbsp;<input maxlength="2" size="5" type="text" id="month" />月&nbsp;</td>
				<td><input type="button" onclick="send_year_month()" id="btn_look_month" value="查看浏览量" />&nbsp;</td>
				<td><div id="show_month"></div></td>
			</tr>
				<!-- 查询当日浏览量 -->
			<script type="text/javascript">
				$(function(){
					var DateObj = new Date()
					var day = DateObj.getDate();
					var month = DateObj.getMonth()+1;
					var year = DateObj.getFullYear();
					$("#day").val("今日是"+year+"-"+month+"-"+day);
				});
				function day_record(){
					
					var DateObj = new Date()
					var day = DateObj.getDate();
					var month = DateObj.getMonth()+1;
					var year = DateObj.getFullYear(); 
					//$("#show_day").text(year+"-"+month+"-"+day);
					
					$.post('UserNumber_day.jsp',{day:day,month:month,year:year},function(data){
						$("#show_day").text($.trim(data));
					});
					
				}
			</script>
			<tr>
				<td>当日浏览量查询:&nbsp;</td>
				<td><input type="text" id="day" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input type="button" id="btn_look_day" onclick="day_record()" value="查看浏览量" />&nbsp;</td>
				<td><div id="show_day"></div></td>
			</tr>
			
			<!-- 查询历史总浏览量 -->
			<script type="text/javascript">
				function all_record(){
					$.post('UserNumber_all.jsp',function(data){
						
						$("#show_all").text($.trim(data));
					});
					
					
				}
			</script>
			<tr>
				<td>历史总浏览量查询:&nbsp;</td>
				<td></td>
				<td><input onclick="all_record()" type="button" value="历史总浏览量查询" />&nbsp;</td>
				<td ><div id="show_all"></div></td>
			
			</tr>

		</table>
	</div>

	</p>


	</div>
</body>
</html>
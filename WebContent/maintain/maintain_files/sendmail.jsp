<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page
	import="javax.mail.*, javax.mail.internet.*,javax.activation.*,java.util.*,java.io.*,org.springframework.context.ApplicationContext"%>
<%@ page
	import="com.maintain.service.MaintainService,com.maintain.domain.Maintain,org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	//姓名
	String name = request.getParameter("name");
	//手机号码
	String phone = request.getParameter("phone");
	//寝室号
	String address = request.getParameter("address");
	//空闲时间
	String freetime = request.getParameter("freetime");
	//维护类型
	String weihu = request.getParameter("weihu");
	//设备类型
	String shebei = request.getParameter("shebei");
	//软件平台
	String pingtai = request.getParameter("pingtai");
	//故障现象
	String guzhang = request.getParameter("guzhang");
	//故障详细描述
	String content = request.getParameter("content");
	//验证码
	String checkcode = request.getParameter("code");
%>
<%
	if (checkcode.equals("") || checkcode == null) {
		%>
		<%="fail"%>
		<%
	} else {
		if (!checkcode.equals((String) session.getAttribute("rand_"))) {
			%>
			<%="fail"%>
			<%
		} else {
			//out.print("登录成功");
			try {
				//入库
				ApplicationContext appContext = new ClassPathXmlApplicationContext(
						"beans.xml");
				MaintainService maintainService = (MaintainService) appContext
						.getBean("maintainService");

				Date common_date = new Date();
				// 输出年月日
				DateFormat short_date = DateFormat.getDateInstance();

				// 输出完整的年月日时分秒
				DateFormat full_Time = DateFormat.getDateTimeInstance(
						DateFormat.MEDIUM, DateFormat.MEDIUM);

				Maintain maintain = new Maintain();

				maintain.setAddress(address);
				maintain.setContent(content);
				maintain.setDateTime(full_Time.format(common_date));
				maintain.setFreetime(freetime);
				maintain.setGuzhang(guzhang);
				maintain.setName(name);
				maintain.setPhone(phone);
				maintain.setPingtai(pingtai);
				maintain.setShebei(shebei);
				maintain.setWeihu(weihu);

				maintainService.add(maintain);

				//
				String from = "dick44556@163.com";//发件人Mail
				String subject = "计协维修通知-" + name + "-" + phone;//邮件标题
				String to = "dick44556@163.com";//收件人Email
				String text = "计协维修申请表" + "\n" + "姓名：" + name + "\n"
						+ "手机号码：" + phone + "\n" + "寝室号：" + address
						+ "\n" + "空闲时间：" + freetime + "\n" + "维护类型："
						+ weihu + "\n" + "设备类型：" + shebei + "\n"
						+ "软件平台：" + pingtai + "\n" + "故障现象：" + guzhang
						+ "\n" + "故障详细描述：" + content + "\n";//内容

				Properties props = new Properties();
				Session sendsession;
				Transport transport;
				sendsession = Session.getInstance(props, null);
				props.put("mail.smtp.host", "smtp.163.com");
				props.put("mail.smtp.auth", "true"); //是否验证 
				sendsession.setDebug(true);
				//
				Message message = new MimeMessage(sendsession);

				message.setFrom(new InternetAddress(from));

				message.setRecipient(Message.RecipientType.TO,
						new InternetAddress(to));

				message.setSubject(subject);

				message.setSentDate(new Date());

				message.setText(text);

				message.saveChanges();

				transport = sendsession.getTransport("smtp");

				transport.connect("smtp.163.com", "dick44556",
						"1677897zhouqiufu");

				transport.sendMessage(message,
						message.getAllRecipients());

				transport.close();

			} catch (MessagingException me) {
%>
<%="fail"%>
<%
	}

		}
	}
%>





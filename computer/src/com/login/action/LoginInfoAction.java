package com.login.action;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.log4j.Log;
import com.login.domain.LoginInfo;
import com.login.service.LoginInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginInfoAction extends ActionSupport {

	private LoginInfo loginInfo;

	public LoginInfo getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(LoginInfo loginInfo) {
		this.loginInfo = loginInfo;
	}

	public String execute() throws IOException {
		
		String isOk =ERROR;
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"beans.xml");
		LoginInfoService loginInfoService = (LoginInfoService) appContext
				.getBean("loginInfoService");
				
		String username;
		String password;
	    String code;
	    code = loginInfo.getCode();
	    username = loginInfo.getUsername();
	    password = loginInfo.getPassword();


	    if(username!=null && password!=null && code!=null ){
	    	
	    	if(loginInfoService.getResult(username, password)){
	    		HttpSession s = ServletActionContext.getRequest().getSession();
	    		if(s.getAttribute("rand_login").equals(code)){
		    		s.setAttribute("IsLogin", "login");
		    		s.setMaxInactiveInterval(1800);//设置session过期时间，当电脑不活动30秒钟就过期
		    		ServletActionContext.getResponse().sendRedirect("rear/rearAdmin.jsp");
		    		Log.getLogger().info("登陆成功！将跳转到   'rear/rearAdmin.jsp' ");
		    		isOk = null;
	    		}
	    	}
	    	
	    }
	    
	    
		return isOk;
	}
}

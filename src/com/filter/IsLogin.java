package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/rear/*")
public class IsLogin implements Filter {

	public IsLogin() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        HttpSession session=req.getSession();
		String isLogin = (String) session.getAttribute("IsLogin");
		System.out.println(isLogin);
		//如果未登陆，则跳转到另外一个页面
		if(isLogin==null){
			System.out.println("login fail");
			//res.sendRedirect("login.jsp");
			req.getRequestDispatcher("login.jsp").forward(req, res);
		}
		else{
			System.out.println("Touchdown confirmed");
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}

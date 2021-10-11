package com.jwnming.intercept_filter;

import com.jwnming.entity.Admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class MyFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("登录拦截");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		if(admin == null) {
			resp.sendRedirect("/zzu_admin/zTest_login.jsp");
		} else {
			chain.doFilter(req,resp);//放行请求
		}
	}

	@Override
	public void destroy() {
		//销毁
	}


}

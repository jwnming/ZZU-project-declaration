package com.jwnming.intercept_filter;

import com.jwnming.entity.Admin;
import com.jwnming.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class UserInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		
		HttpSession session = request.getSession();
		User student = (User) session.getAttribute("user");
		if(student == null) {
			response.sendRedirect("/zzu/zTest_login.jsp");
		}
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView mav)
			throws Exception {
		//mav.setViewName("redirect:/zTest_login.jsp");

	}

	@Override
	public boolean preHandle(HttpServletRequest request , HttpServletResponse response , Object arg2) throws Exception {
		HttpSession session = request.getSession();
		User student = (User) session.getAttribute("user");
		if(student == null) {
			response.sendRedirect("/zzu/zTest_login.jsp");
			return false;
		}
		return true;
		
	}

}

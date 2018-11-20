package com.team.cos.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		세션이 있으면 true 반환 없으면 null 반환=>return true: 정상적인 controller 실행
		HttpSession session = request.getSession(false);
		if (session != null) {
			Object result = session.getAttribute("loginInfo");
			if (result != null) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/userinfo/userlogin");
		return false;
	}

}

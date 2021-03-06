package com.khrd.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Object loginId = modelAndView.getModel().get("login");
		if(loginId != null) {
			//session영역의 Auth키에 userId 저장
			System.out.println("로그인 완료");
			request.getSession().setAttribute("Auth", loginId);
			System.out.println("로그인 성공");
			response.sendRedirect(request.getContextPath() + "/photo/view"); //사진 보기 이동
		}
	}

}

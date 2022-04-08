package com.petpular.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		if (userId != null && uri.startsWith("/user")) {
			// 로그인 된 상태에서 반려동물 등록 페이지 접근
			response.sendRedirect("/main");
			return false;
		} else if (userId == null) {
			// 로그인 안 된상태
			if (uri.startsWith("/mypet")) {
				response.sendRedirect("/user/login");
				return false;
			}
//			if (uri.equals("/main")) {
//				response.sendRedirect("/user/login");
//				return false;
//			}
			if (uri.equals("/community")) {
				response.sendRedirect("/user/login");
				return false;
			}
			
			if (uri.equals("/foryou")) {
				response.sendRedirect("/user/login");
				return false;
			}	
		}
		
		return true;
	}
}

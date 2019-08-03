package com.hwaboon.myapp.commons.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 발동!");
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 후 이용할 수 있습니다.'); location.href='/user/login';</script>");
			out.flush();//출력버퍼를 비우는 코드
			out.close();
			
			return false;
		}
		
		return true;
	}
}

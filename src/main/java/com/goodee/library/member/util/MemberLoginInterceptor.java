package com.goodee.library.member.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.library.member.dto.MemberDto;

public class MemberLoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트의 요청이 서버에 도착하기 전
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session != null) {
			MemberDto dto 
				= (MemberDto)session.getAttribute("loginedMember");
			if(dto != null) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/login");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 서버가 요청을 처리하고 뷰로 전달하기 전
		// 로그 남기기
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 클라이언트의 요청이 서버에서 실행되고 뷰에 응답 완료
		// 비동기 통신 정상 동작 여부
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}

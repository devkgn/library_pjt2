package com.goodee.library.member.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberViewController {

	private static final Logger LOGGER = 
			LogManager.getLogger(MemberViewController.class);
	
	/**
	 * 메소드 이름 : openJoin 
	 * 방식 : get 
	 * url : /join 
	 * 화면 : member/join
	 */
	@GetMapping("/join")
	public String openJoin() {
		LOGGER.info("회원가입 화면 이동");
		return "member/join";
	}
	
	/*
	 * 메소드 이름 : openLogin 
	 * 방식 : get 
	 * url : /login 
	 * 화면 : member/login.jsp
	 */
	@GetMapping("/login")
	public String openLogin() {
		LOGGER.info("로그인 화면 이동");
		return "member/login";
	}
}

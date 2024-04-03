package com.goodee.library;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	private static final Logger LOGGER =
			LogManager.getLogger(HomeController.class);
	
	@GetMapping({"","/"})
	public String home() {
		LOGGER.info("도서관 관리 시스템");
		return "home";
	}
	
}

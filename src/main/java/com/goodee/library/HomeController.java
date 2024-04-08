package com.goodee.library;


import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.library.book.dto.BookDto;

@Controller
public class HomeController {
	
	private static final Logger LOGGER =
			LogManager.getLogger(HomeController.class);
	
	@GetMapping({"","/"})
	public String home() {
		LOGGER.info("도서관 관리 시스템");
		// 1. 도서 목록 조회
		// 2. List<BookDto>
		// 3. bookService 의존성 주입
		// 4. selectBookListToday();
		// 5. where DATE_FORMAT(b_reg_date, '%Y-%m-%d') = CURDATE()
		
		List<BookDto> resultList = new ArrayList<BookDto>();
		for(BookDto dto : resultList) {
			LOGGER.info(dto.getB_name());
		}

		return "home";
	}
	
}

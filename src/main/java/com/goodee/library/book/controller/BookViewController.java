package com.goodee.library.book.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookViewController {

	private static final Logger LOGGER 
		= LogManager.getLogger(BookViewController.class);
	
	@GetMapping("/book")
	public String bookList() {
		LOGGER.info("도서 목록 화면 이동");
		return "book/list";
	}
	
	@GetMapping("/book/add")
	public String createBook() {
		LOGGER.info("도서 등록 화면 이동");
		return "book/add";
	}
}

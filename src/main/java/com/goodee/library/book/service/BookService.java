package com.goodee.library.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.library.book.dao.BookDao;
import com.goodee.library.book.dto.BookDto;

@Service
public class BookService {
	
	private static final Logger LOGGER 
		= LogManager.getLogger(BookService.class);
	
	@Autowired
	BookDao bookDao;
	
	public Map<String,String> createBook(BookDto dto){
		// 1. 비어있는 Map
		// 2. dao 결과에 따라서 Map 변경
		LOGGER.info("도서 정보 등록 요청");
		Map<String,String> map = new HashMap<String,String>();
		map.put("res_code", "404");
		map.put("res_msg", "도서 정보 등록중 오류가 발생했습니다.");
		if(bookDao.createBook(dto) > 0) {
			map.put("res_code", "200");
			map.put("res_msg", "도서 정보가 등록되었습니다.");
		}
		return map;	
	}
	
	public int selectBookCount(String b_name) {
		LOGGER.info("전체 도서 개수 조회 요청");
		int result = 0; 
		result = bookDao.selectBookCount(b_name);
		return result;
	}
	
	public List<BookDto> selectBookList(BookDto dto){
		LOGGER.info("전체 도서 정보 조회 요청");
		return bookDao.selectBookList(dto);
	}
	
	public List<BookDto> selectBookListToday(){
		LOGGER.info("오늘 등록된 도서 전체 조회 요청");
		return bookDao.selectBookListToday();
	}
	
	public BookDto selectBookDetail(long b_no) {
		LOGGER.info("pk를 기준으로 도서 1개 정보 조회 요청");
		return bookDao.selectBookDetail(b_no);
	}
	
	public Map<String,String> editBookDetail(BookDto dto){
		LOGGER.info("도서 정보 수정 요청");
		Map<String,String> map = new HashMap<String,String>();
		map.put("res_code", "404");
		map.put("res_msg", "도서 정보 수정 중 오류가 발생했습니다.");
		if(bookDao.editBookDetail(dto) > 0) {
			map.put("res_code", "200");
			map.put("res_msg", "정상적으로 도서 정보가 수정되었습니다.");
		}
		return map;
	}
}

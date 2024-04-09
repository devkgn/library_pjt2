package com.goodee.library.book.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.library.book.dto.BookDto;

@Repository
public class BookDao {
	
	private static final Logger LOGGER 
		= LogManager.getLogger(BookDao.class);
	
	private final String namespace = "com.goodee.library.bookMapper.";
	
	@Autowired
	SqlSession sqlSession;
	
	public int createBook(BookDto dto) {
		LOGGER.info("도서 정보 데이터베이스에 추가");
		int result = 0;
		try {
			result = sqlSession.insert(namespace+"createBook",dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectBookCount(String b_name) {
		LOGGER.info("전체 도서 목록 개수 조회");
		int result = 0;
		try {
			result 
				= sqlSession.selectOne(namespace+"selectBookCount", b_name);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<BookDto> selectBookList(BookDto dto){
		LOGGER.info("전체 도서 목록 조회");
		List<BookDto> resultList = new ArrayList<BookDto>();
		try {
			resultList 
				= sqlSession.selectList(namespace+"selectBookList",dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	public List<BookDto> selectBookListToday(){
		List<BookDto> resultList = new ArrayList<BookDto>();
		try {
			resultList 
				= sqlSession.selectList(namespace+"selectBookListToday");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	public BookDto selectBookDetail(long b_no) {
		LOGGER.info("pk기준으로 도서 정보 1개 조회");
		BookDto dto = new BookDto();
		try {
			dto = sqlSession.selectOne(namespace+"selectBookDetail",b_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int editBookDetail(BookDto dto) {
		LOGGER.info("도서 정보 수정");
		int result = 0;
		try {
			result = sqlSession.update(namespace+"updateBookDetail",dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

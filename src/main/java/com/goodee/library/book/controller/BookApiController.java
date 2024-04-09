package com.goodee.library.book.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.library.book.dto.BookDto;
import com.goodee.library.book.service.BookService;
import com.goodee.library.book.util.UploadFileService;

@Controller
public class BookApiController {
	
	private static final Logger LOGGER = 
			LogManager.getLogger(BookApiController.class);
	
	@Autowired
	UploadFileService uploadFileService;
	
	@Autowired
	BookService bookService;
	
	// 1. Post방식
	// 2. url은 /book
	// 3. Dto, Multipartfile 객체
	// 4. json -> RequestBody(X), @RequestParam(O)
	
	@ResponseBody
	@PostMapping("/book")
	public Map<String,String> createBook(
			BookDto dto, @RequestParam("file") MultipartFile file){
		LOGGER.info("도서 등록 기능");
		// UploadFileService에 upload 메소드 구성
		// return 업로드 된 파일명
		Map<String,String> map = new HashMap<String,String>();
		map.put("res_code", "404");
		map.put("res_msg", "도서 등록 중 오류가 발생했습니다.");
		
		String savedFileName = uploadFileService.upload(file);
		if(savedFileName != null) {
			map.put("res_msg", "파일 업로드는 성공했습니다.");
			dto.setB_thumbnail(savedFileName);
			// b_thumbnail, b_name, b_writer, b_reg_date
			map = bookService.createBook(dto);
		}else {
			map.put("res_msg", "파일 업로드 조차 실패했습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/book/{b_no}")
	public Map<String,String> editBookDetail(
			BookDto dto, @RequestParam("file") MultipartFile file){
		LOGGER.info("도서 수정 기능");
		Map<String,String> map = new HashMap<String,String>();
		map.put("res_code", "404");
		map.put("res_msg", "도서 수정 중 오류가 발생했습니다.");
		
		if("".equals(file.getOriginalFilename()) == false){
			// 1. 새로운 파일을 서버에 업로드
			String savedFileName = uploadFileService.upload(file);
			if(savedFileName != null) { 
				// 2. 기존 파일 삭제(오류만 제거-return true로)
				if(uploadFileService.delete(dto.getB_thumbnail())) {
					// 정상 삭제
					// 3. b_thumbnail 정보 수정
					dto.setB_thumbnail(savedFileName);
				} else {
					map.put("res_msg", "기존 파일 삭제가 실패하였습니다.");
				}
			} else {
				map.put("res_msg", "파일 업로드 중 오류가 발생했습니다.");
			}
		}
		// 4. 도서 정보 수정(실제 데이터 update)
		map = bookService.editBookDetail(dto);
		// b_thumbnail 여부에 따라 쿼리가 달라짐.
		return map;
		
	}
	

}

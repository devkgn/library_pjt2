package com.goodee.library.book.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookDto {

	private long b_no;
	private String b_thumnail; // 표지 파일명
	private String b_name; // 책 이름
	private String b_writer; // 작가
	private Date b_reg_date;
	private Date b_mod_date;
}

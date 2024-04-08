package com.goodee.library.book.util;

public class Paging {
	// 전체 정보 개수
	private int totalData;
	// 전체 페이지 개수
	private int totalPage;
	// 페이징바
	private int pageBarSize = 5; 
	private int pageBarStart;
	private int pageBarEnd;
	// 현재 페이지
	private int nowPage = 1;
	private int numPerPage = 8;
	private int limit_pageNo;
	// 이전, 다음 여부
	private boolean prev = true;
	private boolean next = true;
	
	public int getTotalData() {
		return totalData;
	}
	public void setTotalData(int totalData) {
		this.totalData = totalData;
		calcPaging();
	}
	private void calcPaging() {
		limit_pageNo = (nowPage-1)*numPerPage;
		totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		pageBarStart = ((nowPage-1)/pageBarSize) * pageBarSize +1;
		pageBarEnd = pageBarStart + pageBarSize -1;
		if(pageBarEnd > totalPage) pageBarEnd = totalPage;
		
		if(pageBarStart == 1) prev = false;
		if(pageBarEnd >= totalPage) next = false;
	}
	
	
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageBarSize() {
		return pageBarSize;
	}
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize = pageBarSize;
	}
	public int getPageBarStart() {
		return pageBarStart;
	}
	public void setPageBarStart(int pageBarStart) {
		this.pageBarStart = pageBarStart;
	}
	public int getPageBarEnd() {
		return pageBarEnd;
	}
	public void setPageBarEnd(int pageBarEnd) {
		this.pageBarEnd = pageBarEnd;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getLimit_pageNo() {
		return limit_pageNo;
	}
	public void setLimit_pageNo(int limit_pageNo) {
		this.limit_pageNo = limit_pageNo;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
}

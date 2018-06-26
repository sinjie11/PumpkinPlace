package com.error404.pumpkinplace.pageutil;

// 한 페이지의 보여줄 글 목록의 갯수(start, end)를 계산하기 위한 유틸리티 클래스
public class PaginationCriteria {
	private int page; // 브라우저에서 보고 있는 현재 페이지 번호
	private int numsPerPage; // 한 페이지에 보여줄 글 목록의 갯수
	
	public PaginationCriteria() {
		page = 1; // 현재 페이지 = 1
		numsPerPage = 10; // 한 페이지에 보여줄 글 갯수 = 10
	}
	
	public PaginationCriteria(int page, int numsPerPage) {
		this.page = page;
		this.numsPerPage = numsPerPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getNumsPerPage() {
		return numsPerPage;
	}

	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}

	// board-mapper.xml에 정의된 SQL 문장의 #{start}에 넣어줄 값
	public int getStart() {
		return (page - 1) * numsPerPage + 1;
	}
	
	// board-mapper.xml에 정의된 SQL 문장의 #{end}에 넣어줄 값
	public int getEnd() {
		return page * numsPerPage;
	}
	
} // end class PaginationCriteria
















package com.error404.pumpkinplace.pageutil;

// 페이지 번호 링크들을 만들어 내기 위한 유틸리티 클래스
public class PageLinkMaker {
	private PaginationCriteria criteria;
	private int totalCount; // 테이블의 전체 레코드 갯수
	private int numsOfPageLinks; // 브라우저에서 보여줄 페이지 링크의 갯수
	private int startPageNo; // 페이지 링크의 시작 페이지 번호
	private int endPageNo; // 페이지 링크의 끝 페이지 번호
	private boolean hasPrev; // 이전 페이지 링크가 있는 지 결정
	private boolean hasNext; // 다음 페이지 링크가 있는 지 결정
	
	public PageLinkMaker() { // 디폴트 생성자로 사용 X
		this.numsOfPageLinks = 10;
	}
	
	public PageLinkMaker(int numsOfPageLinks) { // Parameter가 있는 생성자를 사용
		this.numsOfPageLinks = numsOfPageLinks;
	}

	public PaginationCriteria getCriteria() {
		return criteria;
	}

	public void setCriteria(PaginationCriteria criteria) {
		this.criteria = criteria;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNumsOfPageLinks() {
		return numsOfPageLinks;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public boolean isHasPrev() {
		return hasPrev;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	// 멤버 변수 startPageNo, endPageNo, hasNext, hasPrev 값을 계산, 설정
	public void setPageLinkData() {
		// 전체 페이지 링크의 갯수
		int totalPageLinks = (int)
				Math.ceil((double) totalCount / criteria.getNumsPerPage());
		
		int temp = (int)
				Math.ceil((double) criteria.getPage() / numsOfPageLinks) * numsOfPageLinks;
		if (temp > totalPageLinks) {
			endPageNo = totalPageLinks;
		} else {
			endPageNo = temp;
		}
		
		startPageNo = ((endPageNo - 1) / numsOfPageLinks) * numsOfPageLinks + 1;

		if (startPageNo == 1) {
			hasPrev = false;
		} else {
			hasPrev = true;
		}
		
		if (endPageNo * criteria.getNumsPerPage() >= totalCount) {
			hasNext = false;
		} else {
			hasNext = true;
		}
		
	} 
	
	public void setPageLinkDataForSectionNo(int totalCount) {
		int totalPageLinks = (int)
				Math.ceil((double) totalCount / criteria.getNumsPerPage());
		
		int temp = (int)
				Math.ceil((double) criteria.getPage() / numsOfPageLinks) * numsOfPageLinks;
		if (temp > totalPageLinks) {
			endPageNo = totalPageLinks;
		} else {
			endPageNo = temp;
		}
		
		startPageNo = ((endPageNo - 1) / numsOfPageLinks) * numsOfPageLinks + 1;

		if (startPageNo == 1) {
			hasPrev = false;
		} else {
			hasPrev = true;
		}
		
		if (endPageNo * criteria.getNumsPerPage() >= totalCount) {
			hasNext = false;
		} else {
			hasNext = true;
		}
	}
	
} 

















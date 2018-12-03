package com.team.cos.paging.vo;

public class SearchCriteria{
	
	private String searhType;
	private String keyword;
	private int page; 			// 페이지 번호
	private int perPageNum; 	// 페이지 당 보여지는 데이터 개수
	private String filter;		// 게시판 보기 방식

	public SearchCriteria() {
		this.page = 1; // 페이지 번호는 1
		this.perPageNum = 10; // 페이지 당 보여지는 데이터 개수는 10으로 초기화
		this.filter = "q_regdate";
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1; // 페이지 번호가 0보다 작을경우 1로 초기화
		}

		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum; // 시작 데이터 번호 = (페이지 번호 - 1) * 페이지 당 보여지는 데이터 개수
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) { // 페이지 당 보여지는 데이터 개수가 0보다 작거나 100개 이상일 경우 10개로 초기화
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public String getSearhType() {
		return searhType;
	}
	public void setSearhType(String searhType) {
		this.searhType = searhType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searhType=" + searhType + ", keyword=" + keyword + ", page=" + page + ", perPageNum="
				+ perPageNum + ", filter=" + filter + "]";
	}
	
	


	
	
	
	

}

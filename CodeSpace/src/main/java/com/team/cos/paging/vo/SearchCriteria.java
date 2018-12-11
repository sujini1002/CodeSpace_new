package com.team.cos.paging.vo;

public class SearchCriteria {

	private String searchType; // 검색 Type(content, tag)
	private String keyword; // 검색 창 검색 시 사용되는 Keyword Value
	private String tag; // 태그 검색 시 사용될 Keyword
	private int page; // 페이지 번호
	private int perPageNum; // 페이지 당 보여지는 데이터 개수
	private String filter; // 게시판 보기 방식
	private int user_no; // 프로젝트용

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", tag=" + tag + ", page=" + page
				+ ", perPageNum=" + perPageNum + ", filter=" + filter + ", user_no=" + user_no + "]";
	}

}

package com.team.cos.paging.vo;

public class UserCriteria {
	
	private int page; 			// 페이지 번호
	private int perPageNum; 	// 페이지 당 보여지는 데이터 개수
	private String viewType; 	// 유저 리스트 보기 방식
	private String user_nickname;   // 유저 검색 시 사용되는 키워드

	public UserCriteria() {
		this.page = 1; // 페이지 번호는 1
		this.perPageNum = 24; // 페이지 당 보여지는 데이터 개수는  24로 초기화
		this.viewType = "grid";	// 기본 보기 방식은 grid 방식
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

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "UserCriteria [page=" + page + ", perPageNum=" + perPageNum + ", viewType=" + viewType
				+ ", user_nickname=" + user_nickname + "]";
	}
	
	


	

}

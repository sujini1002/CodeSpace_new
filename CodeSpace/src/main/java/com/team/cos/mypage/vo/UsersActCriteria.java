package com.team.cos.mypage.vo;

public class UsersActCriteria {

	private int page; // 페이지 번호
	private int perPageNum; // 페이지 당 보여지는 데이터 개수
	private int user_no;
	private int startNum;

	public UsersActCriteria() {
		this.page = 1; // 페이지 번호는 1
		this.perPageNum = 5; // 페이지 당 보여지는 데이터 개수는 10으로 초기화
	}
	
	public UsersActCriteria(int user_no, int startNum) {
		this.page = 1; // 
		this.perPageNum = 5; 
		this.user_no = user_no;
		this.startNum = startNum;
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
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", user_no=" + user_no + ", startNum="
				+ startNum + "]";
	}


}
package com.team.cos.paging.vo;

public class Criteria {

	private int page; // 페이지 번호
	private int perPageNum; // 페이지 당 보여지는 데이터 개수

	public Criteria() {
		this.page = 1; // 페이지 번호는 1
		this.perPageNum = 10; // 페이지 당 보여지는 데이터 개수는 10으로 초기화
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

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
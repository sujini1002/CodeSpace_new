package com.team.cos.search.vo;

public class searchQuestion {
	 
	int q_no; // 질문글의 고유 번호
	int user_no; // 사용자 고유 번호
	String q_title; // 질문글 제목
	String q_content; // 질문 내용
	String q_regdate; // 질문 작성 날짜
	String q_recommand; // 질문 추천 수
	String q_viewcnt; // 질문글 조회 수
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	public String getQ_recommand() {
		return q_recommand;
	}
	public void setQ_recommand(String q_recommand) {
		this.q_recommand = q_recommand;
	}
	public String getQ_viewcnt() {
		return q_viewcnt;
	}
	public void setQ_viewcnt(String q_viewcnt) {
		this.q_viewcnt = q_viewcnt;
	}
	@Override
	public String toString() {
		return "question [q_no=" + q_no + ", user_no=" + user_no + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_regdate=" + q_regdate + ", q_recommand=" + q_recommand + ", q_viewcnt=" + q_viewcnt + "]";
	}
	
	
	
	
	
}

package com.team.cos.question.vo;

import java.util.Date;

public class QuestionInfo {
	private int q_no;//질문 고유번호
	private int user_no;//사용자 번호
	private String q_title;//질문 제목
	private String q_content;//질문 내용
	private String q_tag;//질문 태크
	private String q_regdate;//질문 작성 날짜
	private int q_recommand;//질문 추천수
	private int q_viewCnt;//질문 조회수
	private String user_nickname;//사용자 닉네임
	
	
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
	public String getQ_tag() {
		return q_tag;
	}
	public void setQ_tag(String q_tag) {
		this.q_tag = q_tag;
	}
	public String getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	public int getQ_recommand() {
		return q_recommand;
	}
	public void setQ_recommand(int q_recommand) {
		this.q_recommand = q_recommand;
	}
	public int getQ_viewCnt() {
		return q_viewCnt;
	}
	public void setQ_viewCnt(int q_viewCnt) {
		this.q_viewCnt = q_viewCnt;
	}
	public int getQ_no() {
		return q_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	@Override
	public String toString() {
		return "QuestionInfo [q_no=" + q_no + ", user_no=" + user_no + ", q_title=" + q_title + ", q_content="
				+ q_content + ", q_tag=" + q_tag + ", q_regdate=" + q_regdate + ", q_recommand=" + q_recommand
				+ ", q_viewCnt=" + q_viewCnt + ", user_nickname=" + user_nickname + "]";
	}
	

}

package com.team.cos.mypage.vo;

public class MyAnsInfo {
	
	private int a_no;
	private int q_no;
	private int user_no;
	private String q_title; // 질문 제목
	private String a_regdate; // 답변 등록일
	private int a_choose; // 답변 채택 여부
	
	public synchronized int getA_no() {
		return a_no;
	}
	public synchronized void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public synchronized int getQ_no() {
		return q_no;
	}
	public synchronized void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public synchronized int getUser_no() {
		return user_no;
	}
	public synchronized void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public synchronized String getQ_title() {
		return q_title;
	}
	public synchronized void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public synchronized String getA_regdate() {
		return a_regdate;
	}
	public synchronized void setA_regdate(String a_regdate) {
		this.a_regdate = a_regdate;
	}
	public synchronized int getA_choose() {
		return a_choose;
	}
	public synchronized void setA_choose(int a_choose) {
		this.a_choose = a_choose;
	}
	
	@Override
	public String toString() {
		return "MyAnsInfo [a_no=" + a_no + ", q_no=" + q_no + ", user_no=" + user_no + ", q_title=" + q_title
				+ ", a_regdate=" + a_regdate + ", a_choose=" + a_choose + "]";
	}

	
}

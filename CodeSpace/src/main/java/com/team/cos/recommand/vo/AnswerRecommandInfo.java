package com.team.cos.recommand.vo;

public class AnswerRecommandInfo {
	
	private int a_no;//질문 고유 번호
	private int user_no;//사용자 번호
	private int a_recommand;//질문의 추천수
	private int a_updown;//추천/비추천 여부 1:추천 0:비추천 3: 추천 /비추천 둘다 안한 상태
	private int status;//이미 사용자가 누른 상태의 값 
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getA_recommand() {
		return a_recommand;
	}
	public void setA_recommand(int a_recommand) {
		this.a_recommand = a_recommand;
	}
	public int getA_updown() {
		return a_updown;
	}
	public void setA_updown(int a_updown) {
		this.a_updown = a_updown;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "AnswerRecommandInfo [a_no=" + a_no + ", user_no=" + user_no + 
			    ", a_recommand=" + a_recommand + ", a_updown=" + a_updown + ", status=" + status
				+ "]";
	}
	
}

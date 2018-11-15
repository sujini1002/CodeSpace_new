package com.team.cos.answer.vo;

public class AnswerInfo {
	private int a_no;//답변 고유번호
	private int q_no;//질문 고유 번호
	private int user_no;//작성자 번호
	private String a_content;//답변 내용
	private String a_tag;//답변 태그
	private String a_regdate;//답변 날짜
	private int a_recommand;//답변  추천수
	private int a_choose;//답변 채택 여부
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
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
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_tag() {
		return a_tag;
	}
	public void setA_tag(String a_tag) {
		this.a_tag = a_tag;
	}
	public String getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(String a_regdate) {
		this.a_regdate = a_regdate;
	}
	public int getA_recommand() {
		return a_recommand;
	}
	public void setA_recommand(int a_recommand) {
		this.a_recommand = a_recommand;
	}
	public int getA_choose() {
		return a_choose;
	}
	public void setA_choose(int a_choose) {
		this.a_choose = a_choose;
	}
	
	@Override
	public String toString() {
		return "AnswerInfo [a_no=" + a_no + ", q_no=" + q_no + ", user_no=" + user_no + ", a_content=" + a_content
				+ ", a_tag=" + a_tag + ", a_regdate=" + a_regdate + ", a_recommand=" + a_recommand + ", a_choose="
				+ a_choose + "]";
	}
	
	
	
}

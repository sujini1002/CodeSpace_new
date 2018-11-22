package com.team.cos.recommand.vo;

public class QuestionRecommandInfo {
	
	private int q_no;//질문 고유 번호
	private int user_no;//사용자 번호
	private int q_isrecommand;//사용자가 특정 질문에 대한 추천 여부
	private int score; //추천 수  +1 인지 -1인지
	private int q_recommand;//질문의 추천수
	private int q_updown;//추천/비추천 여부 1:추천 0:비추천
	private int status;//이미 사용자가 누른 상태의 값 
	
	
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
	public int getQ_isrecommand() {
		return q_isrecommand;
	}
	public void setQ_isrecommand(int q_isrecommand) {
		this.q_isrecommand = q_isrecommand;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getQ_recommand() {
		return q_recommand;
	}
	public void setQ_recommand(int q_recommand) {
		this.q_recommand = q_recommand;
	}
	public int getQ_updown() {
		return q_updown;
	}
	public void setQ_updown(int q_updown) {
		this.q_updown = q_updown;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "QuestionRecommandInfo [q_no=" + q_no + ", user_no=" + user_no + ", q_isrecommand=" + q_isrecommand
				+ ", score=" + score + ", q_recommand=" + q_recommand + ", q_updown=" + q_updown + ", status=" + status
				+ "]";
	}
	
}

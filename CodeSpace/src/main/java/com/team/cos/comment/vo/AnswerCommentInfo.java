package com.team.cos.comment.vo;

public class AnswerCommentInfo {
	private int ac_no;//답변 댓글 고유 번호
	private int a_no;//답변 고유번호
	private int q_no;//질문 고유 번호
	private int user_no;//작성자 번호
	private String user_nickname;//질문 작성자 이름
	private String ac_content;//답변 댓글 내용
	private String ac_regdate;//답변 댓글 작성 날짜
	
	public int getAc_no() {
		return ac_no;
	}
	public void setAc_no(int ac_no) {
		this.ac_no = ac_no;
	}
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
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getAc_content() {
		return ac_content;
	}
	public void setAc_content(String ac_content) {
		this.ac_content = ac_content;
	}
	public String getAc_regdate() {
		return ac_regdate;
	}
	public void setAc_regdate(String ac_regdate) {
		this.ac_regdate = ac_regdate;
	}
	
	@Override
	public String toString() {
		return "AnswerCommentInfo [ac_no=" + ac_no + ", a_no=" + a_no + ", q_no=" + q_no + ", user_no=" + user_no
				+ ", user_name=" + user_nickname + ", ac_content=" + ac_content + ", ac_regdate=" + ac_regdate + "]";
	}
	
}

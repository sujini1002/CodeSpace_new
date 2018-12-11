package com.team.cos.comment.vo;

public class QuestionCommentInfo {
	private int qc_no;//질문 댓글 고유번호
	private int q_no;//질문 번호
	private int user_no;//댓글 작성자 번호
	private String user_nickname;//질문 닉네임
	private String qc_content;//댓글 내용
	private String qc_regdate;//댓글 작성 날짜
	
	public int getQc_no() {
		return qc_no;
	}
	public void setQc_no(int qc_no) {
		this.qc_no = qc_no;
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
	public String getQc_content() {
		return qc_content;
	}
	public void setQc_content(String qc_content) {
		this.qc_content = qc_content;
	}
	
	public String getQc_regdate() {
		return qc_regdate;
	}
	public void setQc_regdate(String qc_regdate) {
		this.qc_regdate = qc_regdate;
	}
	@Override
	public String toString() {
		return "QuestionCommentInfo [qc_no=" + qc_no + ", q_no=" + q_no + ", user_no=" + user_no + ", user_name="
				+ user_nickname + ", qc_content=" + qc_content + ", ac_regdate=" + qc_regdate + "]";
	}
	
	
}

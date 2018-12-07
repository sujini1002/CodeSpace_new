package com.team.cos.news.vo;

public class NewsCommentInfo {

	private int nc_no; // 댓글 고유 번호
	private int n_no; // 소식글고유 번호
	private int user_no; // 댓글 작성자 번호
	private String user_nickname; // 댓글 작성자 닉네임
	private String nc_content; // 댓글 내용
	private String nc_regdate; // 댓글 작성일
	
	public synchronized int getNc_no() {
		return nc_no;
	}
	public synchronized void setNc_no(int nc_no) {
		this.nc_no = nc_no;
	}
	public synchronized int getN_no() {
		return n_no;
	}
	public synchronized void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public synchronized int getUser_no() {
		return user_no;
	}
	public synchronized void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public synchronized String getUser_nickname() {
		return user_nickname;
	}
	public synchronized void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public synchronized String getNc_content() {
		return nc_content;
	}
	public synchronized void setNc_content(String nc_content) {
		this.nc_content = nc_content;
	}
	public synchronized String getNc_regdate() {
		return nc_regdate;
	}
	public synchronized void setNc_regdate(String nc_regdate) {
		this.nc_regdate = nc_regdate;
	}
	
	@Override
	public String toString() {
		return "NewsCommentInfo [nc_no=" + nc_no + ", n_no=" + n_no + ", user_no=" + user_no + ", user_nickname="
				+ user_nickname + ", nc_content=" + nc_content + ", nc_regdate=" + nc_regdate + "]";
	}
	
	
	
	
}

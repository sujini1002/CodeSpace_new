package com.team.cos.bookmark.vo;

public class BookmarkInfo {
	
	private int q_no;
	private int user_no;
	
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
	
	@Override
	public String toString() {
		return "BookmarkInfo [q_no=" + q_no + ", user_no=" + user_no + "]";
	}
	
}

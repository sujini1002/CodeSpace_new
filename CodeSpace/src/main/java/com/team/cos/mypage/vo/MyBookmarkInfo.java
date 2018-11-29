package com.team.cos.mypage.vo;

import java.util.Date;

public class MyBookmarkInfo {
	
	private int q_no;
	private String q_title;
	private Date q_regdate;
	private int q_viewcnt;
	private int q_recommand;
	
	public synchronized int getQ_no() {
		return q_no;
	}
	public synchronized void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public synchronized String getQ_title() {
		return q_title;
	}
	public synchronized void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public synchronized Date getQ_regdate() {
		return q_regdate;
	}
	public synchronized void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public synchronized int getQ_viewcnt() {
		return q_viewcnt;
	}
	public synchronized void setQ_viewcnt(int q_viewcnt) {
		this.q_viewcnt = q_viewcnt;
	}
	public synchronized int getQ_recommand() {
		return q_recommand;
	}
	public synchronized void setQ_recommand(int q_recommand) {
		this.q_recommand = q_recommand;
	}
	
	@Override
	public String toString() {
		return "MyBookmarkInfo [q_no=" + q_no + ", q_title=" + q_title + ", q_regdate=" + q_regdate + ", q_viewcnt="
				+ q_viewcnt + ", q_recommand=" + q_recommand + "]";
	}
	
	

}

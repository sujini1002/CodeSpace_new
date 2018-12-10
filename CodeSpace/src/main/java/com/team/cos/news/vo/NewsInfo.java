package com.team.cos.news.vo;

public class NewsInfo {
	
	private int n_no;
	private String n_title;
	private String n_content;
	private String n_writer;
	private String n_regdate;
	private int n_viewcnt; // 조회수
	private int nc_cnt; // 댓글 수 
	
	public synchronized int getN_no() {
		return n_no;
	}
	public synchronized void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public synchronized String getN_title() {
		return n_title;
	}
	public synchronized void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public synchronized String getN_content() {
		return n_content;
	}
	public synchronized void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public synchronized String getN_writer() {
		return n_writer;
	}
	public synchronized void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public synchronized String getN_regdate() {
		return n_regdate;
	}
	public synchronized void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	public synchronized int getN_viewcnt() {
		return n_viewcnt;
	}
	public synchronized void setN_viewcnt(int n_viewcnt) {
		this.n_viewcnt = n_viewcnt;
	}
	public synchronized int getNc_cnt() {
		return nc_cnt;
	}
	public synchronized void setNc_cnt(int nc_cnt) {
		this.nc_cnt = nc_cnt;
	}
	
	@Override
	public String toString() {
		return "NewsInfo [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_writer=" + n_writer
				+ ", n_regdate=" + n_regdate + ", n_viewcnt=" + n_viewcnt + ", nc_cnt=" + nc_cnt + "]";
	}
	
	

}

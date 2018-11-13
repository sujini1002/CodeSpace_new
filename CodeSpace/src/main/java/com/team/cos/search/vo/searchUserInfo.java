package com.team.cos.search.vo;

public class searchUserInfo {
	
	int user_no;
	String user_id;
	String user_name;
	String user_photo;
	String user_url;
	String user_intro;
	String user_tag;
	int user_score;
	String user_lastlogin;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	public String getUser_url() {
		return user_url;
	}
	public void setUser_url(String user_url) {
		this.user_url = user_url;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	public String getUser_tag() {
		return user_tag;
	}
	public void setUser_tag(String user_tag) {
		this.user_tag = user_tag;
	}
	public int getUser_score() {
		return user_score;
	}
	public void setUser_score(int user_score) {
		this.user_score = user_score;
	}
	public String getUser_lastlogin() {
		return user_lastlogin;
	}
	public void setUser_lastlogin(String user_lastlogin) {
		this.user_lastlogin = user_lastlogin;
	}
	@Override
	public String toString() {
		return "searchUserInfo [user_no=" + user_no + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", user_photo=" + user_photo + ", user_url=" + user_url + ", user_intro=" + user_intro + ", user_tag="
				+ user_tag + ", user_score=" + user_score + ", user_lastlogin=" + user_lastlogin + "]";
	}
	
	
	
	

}

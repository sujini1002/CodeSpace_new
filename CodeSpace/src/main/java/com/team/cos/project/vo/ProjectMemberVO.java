package com.team.cos.project.vo;

import java.util.List;

public class ProjectMemberVO {

	private int project_no;
	private String user_nickname;
	private List<Integer> member;
	private int project_member_no;
	
	private int user_no1;
	private int user_no2;
	private int user_no3;
	private int user_no4;
	
	
	public int getProject_member_no() {
		return project_member_no;
	}
	public void setProject_member_no(int project_member_no) {
		this.project_member_no = project_member_no;
	}
	
	public int getUser_no1() {
		return user_no1;
	}
	public void setUser_no1(int user_no1) {
		this.user_no1 = user_no1;
	}
	public int getUser_no2() {
		return user_no2;
	}
	public void setUser_no2(int user_no2) {
		this.user_no2 = user_no2;
	}
	public int getUser_no3() {
		return user_no3;
	}
	public void setUser_no3(int user_no3) {
		this.user_no3 = user_no3;
	}
	public int getUser_no4() {
		return user_no4;
	}
	public void setUser_no4(int user_no4) {
		this.user_no4 = user_no4;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}

	
	
	
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public List<Integer> getMember() {
		return member;
	}
	public void setMember(List<Integer> member) {
		this.member = member;
	}
	
	
}

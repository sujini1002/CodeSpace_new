package com.team.cos.project.vo;

import java.util.List;

public class ProjectMemberVO {

	private int project_no;
	private int member_no;
	private String user_name;
	private List<Integer> member;
	
	
	
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_nickname) {
		this.user_name = user_nickname;
	}
	public List<Integer> getMember() {
		return member;
	}
	public void setMember(List<Integer> member) {
		this.member = member;
	}

	
	
	
}

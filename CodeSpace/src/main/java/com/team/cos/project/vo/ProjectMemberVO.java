package com.team.cos.project.vo;

import java.util.List;

public class ProjectMemberVO {

	private String user_nickname;
	private List<Integer> member;
	
	
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

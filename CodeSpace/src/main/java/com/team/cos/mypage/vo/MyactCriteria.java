package com.team.cos.mypage.vo;

import com.team.cos.paging.vo.Criteria;

public class MyactCriteria extends Criteria{
	
	private int user_no;
	private int startNum;

	public MyactCriteria() {
		super();
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	
}

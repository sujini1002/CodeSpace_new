package com.team.cos.recommand.vo;

public class AnswerRecommandViewInfo {
	
	private int a_no;
	private int a_updown;
	
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getA_updown() {
		return a_updown;
	}
	public void setA_updown(int a_updown) {
		this.a_updown = a_updown;
	}
	
	@Override
	public String toString() {
		return "AnswerRecommandViewInfo [a_no=" + a_no + ", a_updown=" + a_updown + "]";
	}
	
}

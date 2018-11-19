package com.team.cos.paging.vo;

public class SearchCriteria extends Criteria{
	
	private String searhType;
	private String keyword;
	
	public String getSearhType() {
		return searhType;
	}
	public void setSearhType(String searhType) {
		this.searhType = searhType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searhType=" + searhType + ", keyword=" + keyword + "]";
	}
	
	
	

}

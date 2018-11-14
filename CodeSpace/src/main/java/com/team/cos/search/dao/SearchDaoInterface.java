package com.team.cos.search.dao;

import java.util.List;

public interface SearchDaoInterface {

	public List searchResults(String keyword); // Main 페이지에서 검색 시 결과를 가져오는 메서드
	
	public int searchCnt(String keyword); // Main 페이지에서 검색 결과 갯수를 카운트하는 메서드
	
	public List userList(); // User 페이지에서 유저 리스트를 가져오는 메서드
	
	public List searchUser(String words); // User 페이지에서 검색한 유저 정보를 가져오는 메서드
 
}

package com.team.cos.search.dao;

import java.util.List;

import com.team.cos.search.vo.Criteria;
import com.team.cos.search.vo.SearchCriteria;

public interface SearchDaoInterface {

	public List searchResults(SearchCriteria cri);  // Main 페이지에서 검색 시 결과를 가져오는 메서드
	
	public int searchCnt(SearchCriteria cri); 		// Main 페이지에서 검색 결과 갯수를 카운트하는 메서드
	
	public List listCriteria(Criteria cri); 	// 전체 게시물 리스트를 불러오기 위한 메서드
	
	public int countPaging(Criteria cri); 		// 전체 게시물을 Count 하기 위한 쿼리
	
	
	////////////////////////////////// User 부분 /////////////////////////
	
	public List userList(); // User 페이지에서 유저 리스트를 가져오는 메서드
	
	public List searchUser(String words); // User 페이지에서 검색한 유저 정보를 가져오는 메서드
 
}

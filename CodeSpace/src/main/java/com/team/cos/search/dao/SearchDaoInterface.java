package com.team.cos.search.dao;

import java.util.List;

import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.project.vo.ProjectMemberVO;

public interface SearchDaoInterface {

	public List searchResults(SearchCriteria cri);  // Main 페이지에서 검색 시 결과를 가져오는 메서드
	
	public int searchCnt(SearchCriteria cri); 		// Main 페이지에서 검색 결과 갯수를 카운트하는 메서드
	
	public List searchUser(String words); // User 페이지에서 검색한 유저 정보를 가져오는 메서드
	
	public List searchUserExceptSelectedMember(ProjectMemberVO vo); // 프로젝트 usersearch 페이지에서 검색한 유저 정보를 가져오는 메서드
	
	
	public List searchTag(SearchCriteria cri);		// Tag 검색 결과에 대한 List
	
	public int searchTagCnt(SearchCriteria cri);	// Tag 검색 결과 Count
 
}

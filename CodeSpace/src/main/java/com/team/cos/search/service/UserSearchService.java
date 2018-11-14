package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class UserSearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private SearchDaoInterface searchDao;
	
	// 전체 유저 리스트를 불러오는 메서드
	public List getUserList() {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List<UserInfoVo> userList = searchDao.userList();
		
		return userList;
		
	}
	
	// 검색한 유저 결과를 가져오는 메서드
	public List getSearchUsers(String words) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List<UserInfoVo> searchResult = searchDao.searchUser(words);
				
		return searchResult;
		
	}
	

}

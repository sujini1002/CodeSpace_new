package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class UserSearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private SearchDaoInterface searchDao;
	
	// 검색한 유저 결과를 가져오는 메서드
	public List<UserInfoVo> getSearchUsers(String words) {
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List<UserInfoVo> searchResult = searchDao.searchUser(words);
				
		return searchResult;
		
	}
	
	public List<UserInfoVo> getSearchUsers(ProjectMemberVO vo) {
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		List<UserInfoVo> searchResult = searchDao.searchUserExceptSelectedMember(vo);
		
		return searchResult;
		
	}
	

}

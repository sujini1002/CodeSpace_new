package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.search.dao.SearchDaoInterface;

public class MainSearchService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	 
	private SearchDaoInterface searchDao;
	
	public List getSearchList(String keyword) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List<QuestionInfo> searchList = searchDao.searchResults(keyword);
		
		return searchList;
	}
	
	public int getSearchCnt(String keyword) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		int	resultCnt = searchDao.searchCnt(keyword);
		
		return resultCnt;
	}
}

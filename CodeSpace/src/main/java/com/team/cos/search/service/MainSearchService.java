package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.search.vo.searchQuestion;

public class MainSearchService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	 
	private SearchDaoInterface searchDao;
	
	public List getSearchList(String keyword) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List<searchQuestion> searchList = searchDao.mainSearchList(keyword);
		
		return searchList;
	}
	
	public int getSearchCnt(String keyword) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		int	resultCnt = searchDao.mainSearchCnt(keyword);
		
		return resultCnt;
	}
}

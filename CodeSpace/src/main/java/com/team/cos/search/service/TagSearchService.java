package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.search.dao.SearchDaoInterface;

public class TagSearchService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private SearchDaoInterface searchDao;
	
	// 태그 검색 리스트
	public List searchTag(SearchCriteria cri) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		List list = searchDao.searchTag(cri);
		
		return list;
		
	}
	
	// 태그 검색 결과 카운트
	public int searchTagCnt(SearchCriteria cri) {
		
		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
		
		int resultCnt = searchDao.searchTagCnt(cri);
		
		return resultCnt;
		
	}

}

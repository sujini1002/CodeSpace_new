package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.paging.vo.SearchCriteria;

public class MainSearchService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private SearchDaoInterface searchDao;

//////////////////////////Search 페이지 페이징 /////////////////////////////////////

	// Main 페이지 검색 창 검색 시 결과를 가져오는 메서드
	public List searchResult(SearchCriteria cri) {

		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);

		List<QuestionInfo> results = searchDao.searchResults(cri);

		return results;

	}

	// Main 페이지 검색 결과 갯수를 가져오는 메서드
	public int getSearchCnt(SearchCriteria cri) {

		searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);

		int resultCnt = searchDao.searchCnt(cri);

		return resultCnt;
	}
}

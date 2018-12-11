package com.team.cos.news.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsCriteria;
import com.team.cos.news.vo.NewsInfo;

@Service
public class NewsListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public List<NewsInfo> getNewsList(NewsCriteria cri){
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		cri.setStartNum(cri.getPageStart());
		List<NewsInfo> newsList = dao.getNewsList(cri);
		return newsList;
		
	}
	
	// 최신 글 1개
	public NewsInfo getCurrentNews() {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);

		NewsInfo news = dao.getCurrentNews();
		return news;
	}

	// 전체 게시글 개수 카운트
	public int countNews(NewsCriteria cri) {
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = dao.countNews(cri);
		return resultCnt;
	}

}

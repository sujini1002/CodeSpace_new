package com.team.cos.news.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsInfo;

@Service
public class NewsEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;

	public NewsInfo getNewsEdit(int n_no) {

		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		NewsInfo newsOneView = dao.getNewsView(n_no);
		return newsOneView;
	}
	
	public int editNews(NewsInfo newsInfo, HttpServletRequest request) {
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = 0;
		resultCnt = dao.editNews(newsInfo);
		return resultCnt; 
	}

}

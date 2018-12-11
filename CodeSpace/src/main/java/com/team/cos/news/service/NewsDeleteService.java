package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.news.dao.NewsDao;

@Service
public class NewsDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	

	@Transactional
	public boolean deleteNews(int n_no) {
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		boolean result = false;
		dao.deleteNews(n_no);
		result = true;
		return result;
	}
}

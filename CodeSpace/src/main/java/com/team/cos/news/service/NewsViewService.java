package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsInfo;

@Service
public class NewsViewService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public NewsInfo getNewsView(int n_no) {
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		NewsInfo newsOneView = dao.getNewsView(n_no);
		return newsOneView;
	}
	
}

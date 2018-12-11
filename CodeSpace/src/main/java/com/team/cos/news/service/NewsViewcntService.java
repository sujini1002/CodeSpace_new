package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;

@Service
public class NewsViewcntService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public void n_viewcnt (int n_no) {
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		dao.n_viewcnt(n_no);
	}

}

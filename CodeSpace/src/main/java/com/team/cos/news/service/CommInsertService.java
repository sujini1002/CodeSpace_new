package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;

@Service
public class CommInsertService {

	@Autowired
	private  SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;

	
}

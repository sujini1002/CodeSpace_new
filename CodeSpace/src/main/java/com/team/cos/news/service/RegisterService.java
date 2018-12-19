package com.team.cos.news.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsInfo;

@Service
public class RegisterService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public int writeNews(NewsInfo newsInfo) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = 0;
		resultCnt = dao.writeNews(newsInfo);
		return resultCnt;
	}
}

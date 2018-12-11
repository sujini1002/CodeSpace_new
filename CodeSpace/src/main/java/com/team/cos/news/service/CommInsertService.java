package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsCommentInfo;

@Service
public class CommInsertService {

	@Autowired
	private  SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	@Transactional
	public int writeComm(NewsCommentInfo newsCommentInfo) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = dao.writeComm(newsCommentInfo);
		return resultCnt;
	}

	
}

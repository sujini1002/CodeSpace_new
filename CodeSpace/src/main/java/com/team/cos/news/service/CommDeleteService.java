package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;

@Service
public class CommDeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public boolean deleteComm(int nc_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		boolean result = false;
		
		dao.deleteComm(nc_no);
		
		result = true;
		
		return result;
		
	}
	public int selectNum(int nc_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int num = dao.selectNum(nc_no);
		
		return num;
		
	}
}

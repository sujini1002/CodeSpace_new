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
	// 컨트롤러에서 n_no 찾을수 있게
	public int selectNum(int nc_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int num = dao.selectNum(nc_no);
		return num;
		
	}
}

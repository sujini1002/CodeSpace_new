package com.team.cos.news.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsCommentInfo;

@Service
public class CommEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	// 댓글 하나만 선택하기
	public NewsCommentInfo getComm(int nc_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		
		NewsCommentInfo comm = dao.getComm(nc_no);
		
		return comm;		
	}
	// 컨트롤러에서 n_no 찾을수 있게
	public int selectNum(int nc_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int num = dao.selectNum(nc_no);
		
		return num;
		
	}
	// 수정한거 저장하기
	public int editComm(NewsCommentInfo newsCommentInfo) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = 0;
		resultCnt = dao.editComm(newsCommentInfo);
		return resultCnt;
	}
}

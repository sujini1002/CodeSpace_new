package com.team.cos.news.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsCommentInfo;

@Service
public class NewsCommListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	// 댓글 불러오기
	public List<NewsCommentInfo> getCommList(@RequestParam("n_no") int n_no){
		
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		List<NewsCommentInfo> commList = dao.getNewsCommList(n_no);
		return commList;
	}
	
	// 한 게시글의 댓글 전체 개수
	public int countCommList(@RequestParam("n_no") int n_no) {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		int resultCnt = dao.countNewsComm(n_no);
		return resultCnt;
	}
}

package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.QuestionCommentInterfaceDao;
import com.team.cos.comment.vo.QuestionCommentInfo;

public class QuestionCommentListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionCommentInterfaceDao quesCommDao;
	
	public List<QuestionCommentInfo> selectList(int q_no){

		quesCommDao = sqlSessionTemplate.getMapper(QuestionCommentInterfaceDao.class);
		
		List<QuestionCommentInfo> list = new ArrayList<QuestionCommentInfo>();
		list = quesCommDao.QuesCommOneQuestion(q_no);
		System.out.println("서비스댓글리스트"+list);

		return list;
	}
}

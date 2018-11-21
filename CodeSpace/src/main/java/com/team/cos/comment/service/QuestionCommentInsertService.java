package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.QuestionCommentInterfaceDao;
import com.team.cos.comment.vo.QuestionCommentInfo;

public class QuestionCommentInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionCommentInterfaceDao quesCommDao;
	
	public int insertComm(QuestionCommentInfo questionCommentInfo) {
		
		quesCommDao = sqlSessionTemplate.getMapper(QuestionCommentInterfaceDao.class);
		return quesCommDao.insertQuesComm(questionCommentInfo);
	}
	public List<QuestionCommentInfo> selectList(int q_no){
		
		List<QuestionCommentInfo> list = new ArrayList<QuestionCommentInfo>();
		list = quesCommDao.QuesCommOneQuestion(q_no);
		
		return list;
	}
}

package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.AnswerCommentInterfaceDao;
import com.team.cos.comment.vo.AnswerCommentInfo;

public class AnswerCommentListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerCommentInterfaceDao answCommDao;
	
	public List<AnswerCommentInfo> answerList(int q_no){
		
		answCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		list = answCommDao.anCommListOneQuestion(q_no);
		
		return list;
	}
}

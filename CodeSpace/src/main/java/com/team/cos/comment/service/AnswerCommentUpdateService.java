package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.AnswerCommentInterfaceDao;
import com.team.cos.comment.vo.AnswerCommentInfo;

public class AnswerCommentUpdateService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerCommentInterfaceDao answCommDao;
	
	public int update(AnswerCommentInfo answerCommentInfo) {
		
		answCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		
		return answCommDao.updateComment(answerCommentInfo);
	}
	public int findAnswerNum(int ac_no) {
		return answCommDao.findAnswerNum(ac_no);
	}
	public List<AnswerCommentInfo> listAll(int a_no){
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		list = answCommDao.anCommListOneAnswer(a_no);
		
		return list;
	}
}

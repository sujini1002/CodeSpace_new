package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.AnswerCommentInterfaceDao;
import com.team.cos.comment.vo.AnswerCommentInfo;

public class AnswerCommentInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerCommentInterfaceDao answerCommDao;
	
	public int insert(AnswerCommentInfo anCommentInfo) {
		
		answerCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		
		return answerCommDao.insertComment(anCommentInfo);
	}
	
	public List<AnswerCommentInfo> listAll(int a_no){
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		list = answerCommDao.anCommListOneAnswer(a_no);
		return list;
	}
}

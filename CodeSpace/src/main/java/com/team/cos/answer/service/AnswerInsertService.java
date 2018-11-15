package com.team.cos.answer.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.dao.AnswerInterfaceDao;
import com.team.cos.answer.vo.AnswerInfo;

public class AnswerInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	//답변 등록
	public int insertAnswer(AnswerInfo answerInfo) {
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		return answerDao.insertAnswer(answerInfo);
	}
	
}

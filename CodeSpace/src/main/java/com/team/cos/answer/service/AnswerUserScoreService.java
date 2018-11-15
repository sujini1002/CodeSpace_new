package com.team.cos.answer.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.answer.dao.AnswerInterfaceDao;

public class AnswerUserScoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	@Transactional
	public int updateScore(int user_no,int score) {
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		return answerDao.updateUserScore(user_no, score);
	}
	
	
}

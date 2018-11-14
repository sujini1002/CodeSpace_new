package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.question.dao.QuestionInterfaceDao;

public class QuestionDeleteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	public int findAnswer(int q_no){
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		return questionDao.findAnswer(q_no);
	}
	
	@Transactional
	public int deleteQuestion(int q_no) {
		return questionDao.deleteQuestion(q_no);
	}
	
	public void userScore(int q_no) {
		int userNo = questionDao.findUserNo(q_no);
		questionDao.userScoreUpdate(userNo, -1);
	}
}

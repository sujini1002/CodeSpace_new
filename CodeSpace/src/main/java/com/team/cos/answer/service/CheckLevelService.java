package com.team.cos.answer.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.dao.AnswerInterfaceDao;

public class CheckLevelService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	public boolean checkLevel(int user_no) {
		System.out.println("서비스 드러옴");
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		
		int score = answerDao.checkLevel(user_no);
		System.out.println("score="+score);
		if(score>10) {
			return true;
		}else {
			return false;
		}
	}
	
}

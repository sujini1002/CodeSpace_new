package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.question.dao.QuestionInterfaceDao;

public class QuestionUserScoreService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	//사용자 번호를 가지고 오는 메서드
	public int userNum(int q_no) {
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		return questionDao.findUserNum(q_no);
	}
	
	public void updateScore(int user_no,int score) {
		questionDao.userScoreUdate(user_no, score);
	}

}

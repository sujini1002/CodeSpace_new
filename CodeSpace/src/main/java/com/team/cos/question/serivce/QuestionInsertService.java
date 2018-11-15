package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.question.dao.QuestionInterfaceDao;
import com.team.cos.question.vo.QuestionInfo;

public class QuestionInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	//질문 등록하는 메서드
	@Transactional
	public void insertQuestion(QuestionInfo questionInfo) {
		
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		questionDao.insertQuestion(questionInfo);
		
	}
	
	//질문 번호 출력하는 메서드
	public int questionSelectNum() {
		return questionDao.questionSelectNum();
	}
}

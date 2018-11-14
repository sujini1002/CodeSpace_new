package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.question.dao.QuestionInterfaceDao;
import com.team.cos.question.vo.QuestionInfo;

public class QuestionUpdateService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	@Transactional
	public int updateQuestion(QuestionInfo questionInfo) {
		
		System.out.println("서비스 들어옴");
		System.out.println(questionInfo);
		
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		return questionDao.updateQuestion(questionInfo);
		
	}
}

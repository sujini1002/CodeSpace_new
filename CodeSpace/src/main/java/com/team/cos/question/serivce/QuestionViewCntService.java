package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.question.dao.QuestionInterfaceDao;

public class QuestionViewCntService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	public void viewCnt(int q_no) {
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		questionDao.viewCnt(q_no);
	}

}

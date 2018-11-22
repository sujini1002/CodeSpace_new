package com.team.cos.main.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.main.dao.MainDaoInterface;
import com.team.cos.question.vo.QuestionInfo;

public class MainPageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MainDaoInterface mainDaoInterface;
	
	public List getTopQuestion() {
		
		mainDaoInterface = sqlSessionTemplate.getMapper(MainDaoInterface.class);
		
		List<QuestionInfo> list = mainDaoInterface.getTopQuestion();
		
		return list;
		
	}
	

}

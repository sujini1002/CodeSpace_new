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
		
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		String tag = questionInfo.getQ_tag();
		if(!tag.equals(null)) {
			tag = tag.toLowerCase();
			if(tag.contains("javascript")) {
				tag = tag.replace("javascript", "Javascript");
			}else if(tag.contains("/javascript")) {
				tag = tag.replace("/javascript", "/Javascript");
			}else if(tag.contains("c")) {
				tag = tag.replace("c", "C");
			}else if(tag.contains("/c")) {
				tag = tag.replace("/c", "/C");
			}else if(tag.contains("c++")) {
				tag = tag.replace("c++", "C++");
			}else if(tag.contains("/c++")) {
				tag = tag.replace("/c++", "/C++");
			}else if(tag.contains("c#")) {
				tag = tag.replace("c#", "C#");
			}else if(tag.contains("/c#")) {
				tag = tag.replace("/c#", "/C#");
			}
		}
		 
		questionInfo.setQ_tag(tag);
		
		return questionDao.updateQuestion(questionInfo);
		
	}
}

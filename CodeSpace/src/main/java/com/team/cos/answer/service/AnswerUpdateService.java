package com.team.cos.answer.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.dao.AnswerInterfaceDao;
import com.team.cos.answer.vo.AnswerInfo;

public class AnswerUpdateService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	public int updateAnswer(AnswerInfo answerInfo) {
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		
		String tag = answerInfo.getA_tag();
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
		answerInfo.setA_tag(tag);
		
		return answerDao.updateAnswer(answerInfo);
	}
}

package com.team.cos.answer.service;

import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.dao.AnswerInterfaceDao;
import com.team.cos.answer.vo.AnswerInfo;

public class AnswerListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	public List<AnswerInfo> listAnswer(int q_no,String order){
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		
		List<AnswerInfo> list = new ArrayList<AnswerInfo>();
		list = answerDao.answerList(q_no,order);
		
		
		return list;
	}
	
}

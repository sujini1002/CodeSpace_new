package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.QuestionCommentInterfaceDao;
import com.team.cos.comment.vo.QuestionCommentInfo;

public class QuestionCommentUpdateService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionCommentInterfaceDao questCommDao;
	
	public int updateQc(QuestionCommentInfo questionCommentInfo) {
		
		questCommDao = sqlSessionTemplate.getMapper(QuestionCommentInterfaceDao.class);
		
		return questCommDao.quesCommUpdate(questionCommentInfo);
	}
	
	public List<QuestionCommentInfo> listAll(int qc_no){
		
		int q_no = questCommDao.findQestionNumber(qc_no);

		List<QuestionCommentInfo> list = new ArrayList<QuestionCommentInfo>();
		list = questCommDao.QuesCommOneQuestion(q_no);
		
		return list;
	}
}

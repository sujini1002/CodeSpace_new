package com.team.cos.recommand.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.recommand.dao.QuestionRecommandInterfaceDao;
import com.team.cos.recommand.vo.QuestionRecommandInfo;

public class QuestionRecommandViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionRecommandInterfaceDao quesRecomDao;
	
	public int qRecommand(int q_no,int user_no){
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.userRecommand(q_no, user_no);
	}
	public int isExistUserRecom (QuestionRecommandInfo questionRecommandInfo) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		return quesRecomDao.isExistUserRecom(questionRecommandInfo);
	}
}

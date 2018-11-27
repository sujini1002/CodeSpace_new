package com.team.cos.recommand.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.recommand.dao.AnswerRecommandInterfaceDao;
import com.team.cos.recommand.vo.AnswerRecommandInfo;
import com.team.cos.recommand.vo.AnswerRecommandViewInfo;

public class AnswerRecommandViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerRecommandInterfaceDao answRecomDao;
	
	public List<AnswerRecommandViewInfo> aRecommand(int q_no,int user_no){
		
		answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
		
		return answRecomDao.userRecommand(q_no, user_no);
	}
	public int isExistUserRecom (AnswerRecommandInfo answerRecommandInfo) {
		
		answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
		return answRecomDao.isExistUserRecom(answerRecommandInfo);
	}
	public int isExistUserByQ_no(int q_no, int user_no) {
		
		answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
		return answRecomDao.isExistUserByQ_no(q_no, user_no);
	}
}

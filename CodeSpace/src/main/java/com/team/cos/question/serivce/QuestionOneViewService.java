package com.team.cos.question.serivce;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.question.dao.QuestionInterfaceDao;
import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

public class QuestionOneViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionInterfaceDao questionDao;
	
	public QuestionInfo questionView(int q_no) {
		
		questionDao = sqlSessionTemplate.getMapper(QuestionInterfaceDao.class);
		
		return questionDao.questionViewOne(q_no);
	}
	
	public UserInfoVo questionUser(int q_no) {
		return questionDao.questionUser(q_no);
	}
}

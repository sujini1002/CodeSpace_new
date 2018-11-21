package com.team.cos.answer.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.dao.AnswerInterfaceDao;
import com.team.cos.userinfo.vo.UserInfoVo;

public class AnswerUserInfoService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerInterfaceDao answerDao;
	
	public List<UserInfoVo> answerUserList(int q_no,String order){
		
		answerDao = sqlSessionTemplate.getMapper(AnswerInterfaceDao.class);
		
		List<UserInfoVo> list = new ArrayList<UserInfoVo>();
		list = answerDao.answerUserInfo(q_no,order);
		
		
		return list;
	}
}

package com.team.cos.userinfo.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.userinfo.dao.UserInfoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class UserInfoCheckService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserInfoInterface dao;

	public UserInfoVo userInfoCheck(UserInfoVo userInfoVo) {
		UserInfoVo result = new UserInfoVo();
//		인터페이스 매핑
		dao = sqlSessionTemplate.getMapper(UserInfoInterface.class);
		result = dao.userInfoCheck(userInfoVo);
		return result;
	}
	
	// user_no로 UserInfoVo 저장
	public UserInfoVo userInfoCheckWithNo(int user_no) {
		UserInfoVo result = new UserInfoVo();
		
		dao = sqlSessionTemplate.getMapper(UserInfoInterface.class);
		result = dao.userInfoWithNo(user_no);
				
		return result;
	}
}

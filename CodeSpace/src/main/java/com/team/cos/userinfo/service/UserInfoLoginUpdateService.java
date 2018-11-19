package com.team.cos.userinfo.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.userinfo.dao.UserInfoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class UserInfoLoginUpdateService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserInfoInterface dao;

	public void userLoginUpdate(UserInfoVo userInfoVo) {
		dao = sqlSessionTemplate.getMapper(UserInfoInterface.class);
		dao.userLoginUpdate(userInfoVo);
	}

	public UserInfoVo userLoginCheck(UserInfoVo userInfoVo) {
		UserInfoVo result = new UserInfoVo();
		dao = sqlSessionTemplate.getMapper(UserInfoInterface.class);
		result = dao.userInfoCheck(userInfoVo);
		return result;
		
	}
}

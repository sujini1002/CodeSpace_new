package com.team.cos.userinfo.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.userinfo.dao.UserInfoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class UserInfoChangePwService {

	@Autowired
	private SqlSessionTemplate template;

	@Autowired
	private AES256UtilService enService;

	private UserInfoInterface dao;
	
	
	public int changePw(UserInfoVo userInfoVo)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		dao = template.getMapper(UserInfoInterface.class);

		userInfoVo.setUser_pw(enService.encrypt(userInfoVo.getUser_pw()));

		return dao.userInfoPwChange(userInfoVo);
	}

}

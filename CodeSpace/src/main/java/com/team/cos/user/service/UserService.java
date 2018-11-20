package com.team.cos.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.user.dao.UserDaoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class UserService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserDaoInterface userDao;

	// 전체 유저 리스트를 불러오는 메서드
	public List<UserInfoVo> getUserList() {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		List<UserInfoVo> userList = userDao.userList();

		return userList;
	}

}

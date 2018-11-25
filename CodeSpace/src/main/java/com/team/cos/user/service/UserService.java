package com.team.cos.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.paging.vo.UserCriteria;
import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.user.dao.UserDaoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class UserService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserDaoInterface userDao;

	// 전체 유저 리스트를 불러오는 메서드
	public List<UserInfoVo> getUserList(UserCriteria cri) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		List<UserInfoVo> userList = userDao.userList(cri);

		return userList;
	}

	// 전체 유저 수에 대한 Cnt 메서드
	public int getUserCnt(UserCriteria cri) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		int resultCnt = userDao.countPaging(cri);

		return resultCnt;
	}

	// 검색한 유저 결과를 가져오는 메서드
	public List<UserInfoVo> getUsers(UserCriteria cri) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		List<UserInfoVo> searchResult = userDao.searchUser(cri);

		return searchResult;

	}

	// 검색한 유저에 대한 Cnt 메서드
	public int getSearchCnt(UserCriteria cri) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);

		int resultCnt = userDao.searchCnt(cri);

		return resultCnt;
	}

}

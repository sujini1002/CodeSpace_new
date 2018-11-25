package com.team.cos.user.dao;

import java.util.List;

import com.team.cos.paging.vo.UserCriteria;
import com.team.cos.userinfo.vo.UserInfoVo;

public interface UserDaoInterface {

	public List<UserInfoVo> userList(UserCriteria cri);		// 전체 유저 리스트를 가져오는 메서드
	public int countPaging(UserCriteria cri);				// 유저 리스트에 대한 Count
	public List<UserInfoVo> searchUser(UserCriteria cri); 	// 유저 닉네임에 대해 검색된 결과를 가져오는 메서드
	public int searchCnt(UserCriteria cri);					// 유저 닉네임 검색 결과에 대한 Count
	
}

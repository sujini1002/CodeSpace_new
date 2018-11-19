package com.team.cos.mypage.dao;

import java.util.List;

import com.team.cos.userinfo.vo.UserInfoVo;

public interface MypageInterface {

	// 유저 정보 얻어오기- 마이페이지
	public UserInfoVo getUserInfo(String user_id);
	// 내 정보 수정하기
	public void update(UserInfoVo userInfoVo);
	// 탈퇴하기
	public void memberDelete(String user_id);
	
	
	
	
}

package com.team.cos.mypage.dao;

import com.team.cos.userinfo.vo.UserInfoVo;

public interface MypageInterface {

	public UserInfoVo getUserInfo(String user_id);
	
	public void update(UserInfoVo userInfoVo);
}

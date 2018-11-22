package com.team.cos.userinfo.dao;

import com.team.cos.userinfo.vo.UserInfoVo;

public interface UserInfoInterface {

//	회원 가입용
	public int insertUserInfo(UserInfoVo userInfoVo);

//	로그인 했나 체크
	public UserInfoVo userInfoCheck(UserInfoVo userInfoVo);

//	로그인한 날짜 시간 update
	public void userLoginUpdate(UserInfoVo userInfoVo);
	
// 	user_no로 사용자 정보 select
	public UserInfoVo userInfoWithNo(int user_no);

//	비밀번호 변경
	public int userInfoPwChange(UserInfoVo userInfoVo);
}

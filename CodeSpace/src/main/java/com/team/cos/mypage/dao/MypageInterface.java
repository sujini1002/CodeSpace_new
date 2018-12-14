package com.team.cos.mypage.dao;

import java.util.List;

import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.userinfo.vo.UserInfoVo;

public interface MypageInterface {

	// 유저 정보 얻어오기- 마이페이지
	public UserInfoVo getUserInfo(String user_id);
	// 내 정보 수정하기
//	public void update(UserInfoVo userInfoVo);
	public int update(UserInfoVo userInfoVo);
	// 탈퇴하기
	public void memberDelete(String user_id);
	
	
	// 내가 참여한 프로젝트 정보 가져오기 (project 테이블에서)
	public List<ProjectInfoVO> getProjectByProject(int user_no);
	// 다른 사용자 클릭했을때 다른 사용자의 정보 가져오기
	public UserInfoVo getUsersPage(int user_no);
	
	
	
}

package com.team.cos.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.mypage.vo.MyAnsInfo;
import com.team.cos.mypage.vo.UsersActCriteria;
import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

public interface UsersActDao {

	// 사용자가 한 질문 리스트(페이징 처리)
	public List<QuestionInfo> getUsersQst(UsersActCriteria cri);
	
	// 사용자가 한 질문 개수 카운트
	public int countUsersQst(@Param("user_no") int user_no, UsersActCriteria cri);
	


	
	
	// 사용자가 한 답변 가져오기(페이징 처리)
	public List<MyAnsInfo> getUsersAns(UsersActCriteria cri);
	//public MyAnsInfo getUsersAns(UsersActCriteria cri);
	
	// 사용자가 한 답변 개수 카운트
	public int countUsersAns(@Param("user_no") int user_no, UsersActCriteria cri);
	
	// 스코어 상위 10명 뽑기
	public List<UserInfoVo> getTopTen();
}

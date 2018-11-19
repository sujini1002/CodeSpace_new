package com.team.cos.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.question.vo.QuestionInfo;

public interface MyactivityInterface {

	// 내가 한 질문 가져오기
	public List getMyQst(int user_no);

	// 질문 개수 카운트
	public int countMyQst(int user_no);
	
	// 내가 한 질문 리스트(페이징 처리)
	public List<QuestionInfo> selectMyQst(@Param("user_no") int user_no, @Param("firstRow") int firstRow,
			@Param("endRow") int endRow);

	// 내가 한 답변 가져오기
	// public List getMyAns(int user_no);
}

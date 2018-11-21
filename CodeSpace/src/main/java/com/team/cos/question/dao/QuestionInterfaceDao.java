package com.team.cos.question.dao;

import org.apache.ibatis.annotations.Param;

import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

public interface QuestionInterfaceDao {
	public void insertQuestion(QuestionInfo questionInfo);
	public int questionSelectNum();
	public QuestionInfo questionViewOne(@Param("q_no")int q_no);
	public int findUserNum(@Param("q_no")int q_no);
	public void userScoreUpdate(@Param("user_no")int user_no,@Param("score")int score);
	public UserInfoVo questionUser(@Param("q_no")int q_no);
	public int updateQuestion(QuestionInfo questionInfo);
	public int findAnswer(@Param("q_no")int q_no);
	public int deleteQuestion(@Param("q_no")int q_no);
	public int findUserNo(@Param("q_no")int q_no);
	public int selectUserScore(@Param("user_no")int user_no);
	public void viewCnt(@Param("q_no")int q_no);
}

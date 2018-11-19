package com.team.cos.answer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.answer.vo.AnswerInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

public interface AnswerInterfaceDao {
	
	public int insertAnswer(AnswerInfo answerInfo); 
	public int updateUserScore(@Param("user_no") int user_no,@Param("score")int score);
	public int checkLevel(@Param("user_no")int user_no);
	public List<AnswerInfo> answerList(@Param("q_no")int q_no,@Param("order")String order);
	public List<UserInfoVo> answerUserInfo(@Param("q_no")int q_no,@Param("order")String order);
	public int updateAnswer(AnswerInfo answerInfo);
	
}

package com.team.cos.answer.dao;

import org.apache.ibatis.annotations.Param;

import com.team.cos.answer.vo.AnswerInfo;

public interface AnswerInterfaceDao {
	
	public int insertAnswer(AnswerInfo answerInfo); 
	public int updateUserScore(@Param("user_no") int user_no,@Param("score")int score);
	public int checkLevel(@Param("user_no")int user_no);
}

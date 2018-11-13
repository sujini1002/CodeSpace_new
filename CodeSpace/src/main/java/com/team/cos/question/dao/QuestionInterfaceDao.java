package com.team.cos.question.dao;

import org.apache.ibatis.annotations.Param;

import com.team.cos.question.vo.QuestionInfo;

public interface QuestionInterfaceDao {
	public void insertQuestion(QuestionInfo questionInfo);
	public int questionSelectNum();
	public QuestionInfo questionViewOne(@Param("q_no")int q_no);
}

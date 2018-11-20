package com.team.cos.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.comment.vo.QuestionCommentInfo;

public interface QuestionCommentInterfaceDao {
	
	public int insertQuesComm(QuestionCommentInfo questionCommentInfo);
	public List<QuestionCommentInfo> QuesCommOneQuestion(@Param("q_no")int q_no);
	public int quesCommUpdate(QuestionCommentInfo questionCommentInfo);
	public int findQestionNumber(@Param("qc_no") int qc_no);
	public int deletQComment(@Param("qc_no") int qc_no);
}

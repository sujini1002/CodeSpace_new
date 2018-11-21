package com.team.cos.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.comment.vo.AnswerCommentInfo;

public interface AnswerCommentInterfaceDao {
	
	public int insertComment(AnswerCommentInfo answerCommentInfo);
	public List<AnswerCommentInfo> anCommListOneAnswer(@Param("a_no")int a_no);
	public List<AnswerCommentInfo> anCommListOneQuestion(@Param("q_no")int q_no);
	public int updateComment(AnswerCommentInfo answerCommentInfo);
	public int findAnswerNum(@Param("ac_no")int ac_no);
	public int deleteAc(@Param("ac_no")int ac_no);
	public int countAnswerComm(@Param("a_no")int a_no);
}

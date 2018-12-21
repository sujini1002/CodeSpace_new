package com.team.cos.recommand.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.recommand.vo.AnswerRecommandInfo;
import com.team.cos.recommand.vo.AnswerRecommandViewInfo;

public interface AnswerRecommandInterfaceDao {
	public int isExistUserRecom(AnswerRecommandInfo AnswerRecommandInfo);
	public int insertUserRecom(AnswerRecommandInfo AnswerRecommandInfo);
	public void deleteUserRecom(@Param("a_no")int a_no,@Param("user_no")int user_no);
	public int updateAnswerScore(@Param("a_no")int a_no);
	public int finalAnswRecomNum(@Param("a_no")int a_no);
	public List<AnswerRecommandViewInfo> userRecommand(@Param("q_no")int q_no,@Param("user_no")int user_no);
	public int isExistUserByQ_no(@Param("q_no")int q_no,@Param("user_no")int user_no);
}

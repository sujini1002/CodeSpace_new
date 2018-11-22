package com.team.cos.recommand.dao;

import org.apache.ibatis.annotations.Param;

import com.team.cos.recommand.vo.QuestionRecommandInfo;

public interface QuestionRecommandInterfaceDao {
	
	public int isExistUserRecom(QuestionRecommandInfo questionRecommandInfo);
	public int insertUserRecom(QuestionRecommandInfo questionRecommandInfo);
	public int isUserStatus(QuestionRecommandInfo questionRecommandInfo);
	public int updateQuestionScore(@Param("q_no")int q_no,@Param("score")int score);
	public int finalQuesRecomNum(@Param("q_no")int q_no);
	public int changeUserStatus(QuestionRecommandInfo questionRecommandInfo);
	public int UserUpdown(QuestionRecommandInfo questionRecommandInfo);
	public int userRecommand(@Param("q_no")int q_no,@Param("user_no")int user_no);
}

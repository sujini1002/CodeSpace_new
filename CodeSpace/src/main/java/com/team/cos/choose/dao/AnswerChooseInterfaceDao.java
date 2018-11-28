package com.team.cos.choose.dao;

import org.apache.ibatis.annotations.Param;

public interface AnswerChooseInterfaceDao {
	
	public int selectQNo(@Param("a_no")int a_no);
	public int isExistChoose(@Param("q_no")int q_no);
	public int Choose(@Param("a_no")int a_no);
	public int findUser(@Param("a_no")int a_no);
	public int updateUserScore(@Param("user_no")int user_no);
	public int choosedAnswer(@Param("q_no")int q_no);
	public int choosedCnt(@Param("q_no")int q_no);
}

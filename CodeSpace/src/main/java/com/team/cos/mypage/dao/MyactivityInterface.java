package com.team.cos.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.bookmark.vo.BookmarkInfo;
import com.team.cos.mypage.vo.MyAnsInfo;
import com.team.cos.mypage.vo.MyactCriteria;
import com.team.cos.paging.vo.Criteria;
import com.team.cos.question.vo.QuestionInfo;

public interface MyactivityInterface {

	// 내가 한 질문 리스트(페이징 처리)
	public List<QuestionInfo> getMyQst(MyactCriteria cri);
	
	// 내가 한 질문 개수 카운트
	public int countMyQst(@Param("user_no") int user_no, MyactCriteria cri);
	


	// 내가 한 답변 가져오기(페이징 처리)
	public List<MyAnsInfo> getMyAns(MyactCriteria cri);
	
	// 내가 한 답변 개수 카운트
	public int countMyAns(MyactCriteria cri, @Param("user_no") int user_no);
	
	
	
	// 내가 북마크한거 가져오기
	public List<BookmarkInfo> getMyBmark(MyactCriteria cri);
	
	// 내가 한 북마크 개수 카운트
	public int countMyBmark( @Param("user_no") int user_no, MyactCriteria cri);
}

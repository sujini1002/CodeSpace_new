package com.team.cos.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.news.vo.NewsCommentInfo;
import com.team.cos.news.vo.NewsCriteria;
import com.team.cos.news.vo.NewsInfo;

public interface NewsDao {

	// 게시글 리스트
	public List<NewsInfo> getNewsList(NewsCriteria cri);
	// 메인 페이지 최근 소식 1개만 출력
	public List<NewsInfo> getCurrentNews();
	// 전체 게시글 개수
	public int countNews(NewsCriteria cri);
	// 게시글 하나만 보기
	public NewsInfo getNewsView(@Param("n_no") int n_no);
	
	
	// 게시글 등록하기
	public int writeNews(NewsInfo newsInfo);
	// 게시글 수정하기
	public int editNews(NewsInfo newsInfo);
	// 게시글 삭제하기
	public void deleteNews(@Param("n_no") int n_no);
	
	
	// 조회수 증가
	public void n_viewcnt(@Param("n_no") int n_no);
	
	
	// 댓글 리스트 불러오기
	public List<NewsCommentInfo> getNewsCommList(@Param("n_no") int n_no);
	// 댓글 개수 
	public int countNewsComm(@Param("n_no") int n_no);	
	// 댓글 등록하기
	public int writeComm(NewsCommentInfo newsCommentInfo);
	// 댓글 삭제
	public void deleteComm(@Param("nc_no") int nc_no);
	// 댓글 게시판 번호 찾기
	public int selectNum(@Param("nc_no") int nc_no);
	// 댓글 수정하기
	public int editComm(NewsCommentInfo newsCommentInfo);
	// 댓글 하나만 보기
	public NewsCommentInfo getComm(@Param("nc_no") int nc_no);
	// 게시판에 댓글 개수 보여주기
	//public List<NewsCommentInfo> countComm();	
	
	
	
}

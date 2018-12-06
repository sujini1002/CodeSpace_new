package com.team.cos.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.news.vo.NewsCriteria;
import com.team.cos.news.vo.NewsInfo;

public interface NewsDao {

	// 게시글 리스트
	public List<NewsInfo> getNewsList(NewsCriteria cri);
	// 전체 게시글 개수
	public int countNews(NewsCriteria cri);
	// 게시글 하나만 보기
	public NewsInfo getNewsView(@Param("n_no") int n_no);
	
	// 게시글 등록하기
	public int writeNews(NewsInfo newsInfo);
	
}
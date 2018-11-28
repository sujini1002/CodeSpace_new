package com.team.cos.bookmark.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.bookmark.vo.BookmarkInfo;

public interface BookmarkInterfaceDao {
	
	public int insertBookmark(BookmarkInfo bookmarkInfo);
	public int deleteBookmark(BookmarkInfo bookmarkInfo);
	public int bookmarkSelectCnt(BookmarkInfo bookmarkInfo);
	public List<Integer> userBookmark(@Param("user_no")int user_no);
	public int bookmarkSelectCntView(@Param("q_no")int q_no,@Param("user_no")int user_no);
}
 
package com.team.cos.bookmark.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.bookmark.dao.BookmarkInterfaceDao;
import com.team.cos.bookmark.vo.BookmarkInfo;

public class BookmarkService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkInterfaceDao bookmarkDao;
	
	public int insertBookmark(BookmarkInfo bookmarkInfo) {
		bookmarkDao = sqlSessionTemplate.getMapper(BookmarkInterfaceDao.class);
		return bookmarkDao.insertBookmark(bookmarkInfo);
	}
	public int deleteBookmark(BookmarkInfo bookmarkInfo) {
		bookmarkDao = sqlSessionTemplate.getMapper(BookmarkInterfaceDao.class);
		return bookmarkDao.deleteBookmark(bookmarkInfo);
	}
	public int bookmarkSelectCnt(BookmarkInfo bookmarkInfo) {
		bookmarkDao = sqlSessionTemplate.getMapper(BookmarkInterfaceDao.class);
		return bookmarkDao.bookmarkSelectCnt(bookmarkInfo);
	}
}

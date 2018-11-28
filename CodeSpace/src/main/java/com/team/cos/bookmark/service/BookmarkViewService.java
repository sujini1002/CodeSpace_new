package com.team.cos.bookmark.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.bookmark.dao.BookmarkInterfaceDao;

public class BookmarkViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private BookmarkInterfaceDao bookmarkDao;
	
	public int bookmarkSelectCntView(int q_no,int user_no) {
		bookmarkDao = sqlSessionTemplate.getMapper(BookmarkInterfaceDao.class);
		return bookmarkDao.bookmarkSelectCntView(q_no, user_no);
	}
}

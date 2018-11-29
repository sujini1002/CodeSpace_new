package com.team.cos.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.bookmark.vo.BookmarkInfo;
import com.team.cos.mypage.dao.MyactivityInterface;
import com.team.cos.mypage.vo.MyactCriteria;

@Service
public class MyBookmarkService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MyactivityInterface myActInterface;
	
	
	// 내가 한 북마크 가져오기
	public List<BookmarkInfo> getMyBmark(int user_no, MyactCriteria cri){
		
		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		cri.setUser_no(user_no);
		cri.setStartNum(cri.getPageStart());
		List<BookmarkInfo> myBmarkList = myActInterface.getMyBmark(cri);
		
		return myBmarkList;
		
	}
	
	// 내가 한 북마크 개수
	public int countMyBmark(int user_no, MyactCriteria cri) {
		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		
		int bookmarkCnt = myActInterface.countMyBmark(user_no, cri);
		
		return bookmarkCnt;
		
	}
	
}

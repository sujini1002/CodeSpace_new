package com.team.cos.mypage.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.mypage.dao.MyactivityInterface;
import com.team.cos.mypage.vo.MyQuestionList;
import com.team.cos.question.vo.QuestionInfo;


public class MyQuestionService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MyactivityInterface myActInterface;
	
	private static final int BOARD_COUNT_PER_PAGE = 10;
	
	public MyQuestionList getMyQstList(int pageNumber, int user_no) {
		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		
		int currentPageNumber = pageNumber;
		int boardTotalCount = myActInterface.countMyQst(user_no);
		List<QuestionInfo> myQuestionList = null;
		int firstRow = 0;
		int endRow = 0;

		if (boardTotalCount > 0) {
			firstRow = (pageNumber - 1) * BOARD_COUNT_PER_PAGE;
			endRow = BOARD_COUNT_PER_PAGE;
			myQuestionList = myActInterface.getMyQst(user_no, firstRow, endRow);
		} else {
			currentPageNumber = 0;
			myQuestionList = Collections.emptyList();
		}

		return new MyQuestionList(myQuestionList, boardTotalCount, currentPageNumber, BOARD_COUNT_PER_PAGE, firstRow, endRow);
	}
}

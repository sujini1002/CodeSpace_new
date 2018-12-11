package com.team.cos.mypage.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.mypage.dao.MyactivityInterface;
import com.team.cos.mypage.vo.MyactCriteria;
import com.team.cos.question.vo.QuestionInfo;

public class MyQuestionService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MyactivityInterface myActInterface;

	// 내가 한 질문 가져오기
	public List<QuestionInfo> getMyQst(int user_no, MyactCriteria cri) {

		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		cri.setUser_no(user_no);
	    cri.setStartNum(cri.getPageStart());
		List<QuestionInfo> myQstList = myActInterface.getMyQst(cri);
		return myQstList;

	}

	// 내가 한 질문 카운트
	public int countMyQst(int user_no, MyactCriteria cri) {

		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		int resultCnt = myActInterface.countMyQst(user_no, cri);
		return resultCnt;
	}
}

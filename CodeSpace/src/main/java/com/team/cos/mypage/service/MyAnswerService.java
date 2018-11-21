package com.team.cos.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.answer.vo.AnswerInfo;
import com.team.cos.mypage.dao.MyactivityInterface;
import com.team.cos.mypage.vo.MyAnsInfo;
import com.team.cos.mypage.vo.MyactCriteria;

public class MyAnswerService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MyactivityInterface myActInterface;
	
	// 내가 한 답변 가져오기
	public List<MyAnsInfo> getMyAns(MyactCriteria cri, int user_no) {
		
		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		cri.setUser_no(user_no);
	    cri.setStartNum(cri.getPageStart());
		List<MyAnsInfo> myAnsList = myActInterface.getMyAns(cri);
		
		return myAnsList;
	
	}
	
	// 내가 한 답변 카운트
	public int countMyAns(MyactCriteria cri, int user_no) {
		
		myActInterface = sqlSessionTemplate.getMapper(MyactivityInterface.class);
		
		int resultCnt = myActInterface.countMyAns(cri, user_no);
		
		return resultCnt;
	}
	
	
}

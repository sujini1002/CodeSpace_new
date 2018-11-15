package com.team.cos.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.question.vo.QuestionInfo;

public class ActivityService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;
	
	// 내가 한 질문 얻어오기
	public List getMyQst(int user_no) {
		System.out.println("질문 서비스 들어옴");
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
	
		// 로그인 한 회원의 유저넘버로 내가 한 질문 찾기
		List<QuestionInfo> qstInfo = mypageInterface.getMyQst(user_no);
		
		return qstInfo;
	
	}
	
	// 내가 한 답변 얻어오기
	/*public List getMyAns(int user_no) {
		
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		
		List<QuestionInfo> qstInfo = mypageInterface.getMyAns(user_no);
		
		return qstInfo;
	}*/
	
	
	
	
}

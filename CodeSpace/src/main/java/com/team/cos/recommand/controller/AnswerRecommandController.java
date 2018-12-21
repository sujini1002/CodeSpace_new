package com.team.cos.recommand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.recommand.service.AnswerRecommandService;
import com.team.cos.recommand.vo.AnswerRecommandInfo;

@Controller
public class AnswerRecommandController {

	@Autowired
	private AnswerRecommandService service;

	@RequestMapping(value = "/answer/answerRecommand", method = RequestMethod.POST)
	@ResponseBody
	public AnswerRecommandInfo recommand(AnswerRecommandInfo answerRecommandInfo) {
		//답변번호,사용자번호,증가(1)/차감(0)
		int a_no = answerRecommandInfo.getA_no();
		int user_no = answerRecommandInfo.getUser_no();
		int score = answerRecommandInfo.getA_updown();
		
		//결과를 저장할 객체 
		AnswerRecommandInfo result = new AnswerRecommandInfo();
		
		//답변번호와 사용자번호가 맞는 행이 있는지 체크 
		if(service.isExistUserRecom(answerRecommandInfo)>0) {
			//있으면 테이블 삭제후 답변 추천 갯수 업데이트(답변번호에 맞는 추천 카운트 - 답변번호에 맞는 비추천 카운트)
			service.deleteUserRecom(a_no, user_no);
			//답변 추천 수 업데이트
			service.updateAnswerScore(a_no);
			//추천해제 상태 결과객체에 저장
			result.setStatus(0);
		}else {
			//없으면 테이블 인서트 후 답변 추천 갯수 업데이트(답변번호에 맞는 추천 카운트 - 답변번호에 맞는 비추천 카운트)
			service.insertUserRecom(answerRecommandInfo);
			//답변 추천 수 업데이트
			service.updateAnswerScore(a_no);
			//추천해제 상태 결과객체에 저장
			result.setStatus(1);
		}
		
		result.setA_recommand(service.finalAnswRecomNum(a_no));
		
		return result;
	}
}

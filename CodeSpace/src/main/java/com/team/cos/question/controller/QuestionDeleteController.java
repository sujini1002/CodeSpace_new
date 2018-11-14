package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.question.serivce.QuestionDeleteService;

@Controller
@RequestMapping("/question/deleteQuestion")
public class QuestionDeleteController {
	
	@Autowired
	private QuestionDeleteService service;
	
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public String deleteQuestion(@RequestParam("q_no")int q_no) {
		
		int answerCnt = service.findAnswer(q_no);
		String resultJson ="";
		
		if(answerCnt > 0) {
			//JSON  형식으로 저장
			resultJson = "{\"result\": \"" + 0 + "\"}";
		}else {
			
			//user번호 구하기
			int userNo = service.findUserNo(q_no);
			
			//질문 삭제
			int result = service.deleteQuestion(q_no);
			
			//사용자 점수 차감
			service.userScore(userNo);
			
			resultJson = "{\"result\": \"" + result + "\"}";
		}
		
		return resultJson;
	}
}
//주석
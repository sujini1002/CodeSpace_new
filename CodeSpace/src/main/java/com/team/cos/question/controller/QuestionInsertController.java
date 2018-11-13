package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.question.serivce.QuestionInsertService;
import com.team.cos.question.vo.QuestionInfo;

@Controller
@RequestMapping("/question/insertQuestion")
public class QuestionInsertController {
	
	@Autowired
	private QuestionInsertService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String insertForm() {
		return "/question/insertForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String insertQuestion(QuestionInfo questionInfo) {
		
		System.out.println(questionInfo);
		
		//질문등록
		service.insertQuestion(questionInfo);
		
		//질문번호 출력
		int q_no = service.questionSelectNum();
		
		//JSON  형식으로 저장
		String resultJson = "{\"q_no\": \"" +q_no + "\"}";
		
		
		return resultJson;
	}
}

package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.question.serivce.QuestionUpdateService;
import com.team.cos.question.vo.QuestionInfo;

@Controller
@RequestMapping("/question/updateQuestion")
public class QuestionUpdateController {
	
	@Autowired
	private QuestionUpdateService service;
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String updateQuestion(QuestionInfo questionInfo) {
		
		int result = service.updateQuestion(questionInfo);
		
		//JSON  형식으로 저장
		String resultJson = "{\"result\": \"" +result + "\"}";
		
		return resultJson;
	}
}

package com.team.cos.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.answer.service.AnswerUpdateService;
import com.team.cos.answer.vo.AnswerInfo;

@Controller
@RequestMapping("/answer/updateAnswer")
public class AnswerUpdateController {
	
	@Autowired
	private AnswerUpdateService service;
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String updateAnswer(AnswerInfo answerInfo) {
		
		int result = service.updateAnswer(answerInfo);
		//JSON  형식으로 저장
		String resultJson = "{\"result\": \"" +result + "\"}";
		return resultJson;
	}
}

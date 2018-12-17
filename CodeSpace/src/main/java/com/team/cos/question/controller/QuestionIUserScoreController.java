package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.question.serivce.QuestionUserScoreService;

@Controller
public class QuestionIUserScoreController {
	
	@Autowired
	private QuestionUserScoreService service;
	
	@RequestMapping("/question/userscore")
	@ResponseBody
	public String updateScore(@RequestParam("q_no")int q_no,@RequestParam("score")int score) {
		
		int user_no = service.userNum(q_no);
		
		service.updateScore(user_no, score);
		
		
		
		//JSON  형식으로 저장
		String resultJson = "{\"q_no\": \"" +q_no + "\"}";
		
		return resultJson;
	}
}

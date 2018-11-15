package com.team.cos.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.answer.service.AnswerInsertService;
import com.team.cos.answer.service.AnswerUserScoreService;
import com.team.cos.answer.vo.AnswerInfo;

@Controller
@RequestMapping("/answer/insertAnswer")
public class AnswerInsertController {

	@Autowired
	private AnswerInsertService insertSerivce;
	@Autowired
	private AnswerUserScoreService scoreService;

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public String insertAnswer(AnswerInfo answerInfo) {
		//답변 등록
		insertSerivce.insertAnswer(answerInfo);
		//사용자 점수 증가
		int result = scoreService.updateScore(answerInfo.getUser_no(), 1);
		//JSON  형식으로 저장
		String resultJson = "{\"result\": \"" +result + "\"}";

		return resultJson;
	}
}

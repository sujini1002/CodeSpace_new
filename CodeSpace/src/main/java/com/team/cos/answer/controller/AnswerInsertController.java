package com.team.cos.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.answer.service.AnswerInsertService;
import com.team.cos.answer.vo.AnswerInfo;

@Controller
@RequestMapping("/answer/insertAnswer")
public class AnswerInsertController {
	
	@Autowired
	private AnswerInsertService serivce;
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertAnswer(AnswerInfo answerInfo) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		int result = serivce.insertAnswer(answerInfo);
		
		return modelAndView;
	}
}

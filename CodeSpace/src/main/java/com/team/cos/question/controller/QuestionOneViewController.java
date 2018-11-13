package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.question.serivce.QuestionOneViewService;
import com.team.cos.question.vo.QuestionInfo;

@Controller
@RequestMapping("/question/questionView")
public class QuestionOneViewController {
	
	@Autowired
	private QuestionOneViewService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView questionView(@RequestParam("q_no")int q_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		QuestionInfo questionInfo = service.questionView(q_no);
		
		modelAndView.addObject("questionInfo", questionInfo);
		modelAndView.setViewName("question/questionOneView");
		
		return modelAndView;
	}
}

package com.team.cos.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.main.service.MainPageService;

//////// 미사용 -> Home Controller에 구현   ////////////////////////////

public class TopQuestionController {

	/*
	@Autowired
	MainPageService mainPageService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView getMain() {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(mainPageService.getTopQuestion());
		
		mav.addObject("topQuestions", mainPageService.getTopQuestion());
		mav.setViewName("/home");
		
		return mav;
		
	}
	*/

}

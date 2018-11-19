package com.team.cos.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyQuestionService;

@Controller
@RequestMapping("/mypage/activity")
public class MyQuestionController {

	@Autowired
	private MyQuestionService service;
	
	@RequestMapping(method = RequestMethod.GET)	
	public ModelAndView getMyQstList(@RequestParam("user_no") int user_no,
			@RequestParam(value="page", required = false, defaultValue = "1") int pageNumber, 
			HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/activity");
		modelAndView.addObject("myQst", service.getMyQstList(pageNumber, user_no));
		
		System.out.println("컨트롤러"+service.getMyQstList(pageNumber, user_no));
		
		return modelAndView;
	}
}

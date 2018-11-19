package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.ActivityService;

@Controller
public class ActivityController {
	
/*	@Autowired
	private ActivityService service;

	@RequestMapping("/mypage/activity")
	public ModelAndView getActivity(@RequestParam("user_no")int user_no) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("myQst", service.getMyQst(user_no));
		modelAndView.setViewName("mypage/activity");
		return modelAndView;
		
	}*/
}

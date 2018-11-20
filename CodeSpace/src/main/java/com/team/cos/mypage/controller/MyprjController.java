package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyprjService;

@Controller
@RequestMapping("/mypage/myPrj")
public class MyprjController {
	
	@Autowired
	private MyprjService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMyprj(@RequestParam("user_no") int user_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("myPrjList", service.getMyprj(user_no));
		modelAndView.setViewName("mypage/myPrj");
		
		System.out.println(user_no);
		
		return modelAndView;
	}

}

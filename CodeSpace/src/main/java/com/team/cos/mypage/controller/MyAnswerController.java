package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyAnswerService;
import com.team.cos.mypage.vo.MyactCriteria;
import com.team.cos.mypage.vo.PageMaker;

@Controller
@RequestMapping("/mypage/myans")
public class MyAnswerController {
	
	@Autowired
	private MyAnswerService service;

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMyAns(@ModelAttribute("cri") MyactCriteria cri,
			@RequestParam("user_no") int user_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countMyAns(cri, user_no));

		modelAndView.addObject("myAnsList", service.getMyAns(cri, user_no));
		modelAndView.addObject("pageMaker", pageMaker);
		modelAndView.setViewName("mypage/myans");
		
		return modelAndView;
		
	}
}

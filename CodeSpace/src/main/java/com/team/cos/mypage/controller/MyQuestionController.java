package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyQuestionService;
import com.team.cos.mypage.vo.MyactCriteria;
import com.team.cos.mypage.vo.PageMaker;

@Controller
@RequestMapping("/mypage/myqst")
public class MyQuestionController {

	@Autowired
	private MyQuestionService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMyQst(@RequestParam("user_no") int user_no,
			@ModelAttribute("cri") MyactCriteria cri) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("myQstList", service.getMyQst(user_no, cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countMyQst(user_no, cri));
		
		modelAndView.addObject("pageMaker", pageMaker);
		modelAndView.setViewName("mypage/myqst");
		
		return modelAndView;
		
	}
}

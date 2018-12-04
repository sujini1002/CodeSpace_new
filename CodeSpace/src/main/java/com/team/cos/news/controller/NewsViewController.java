package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.NewsViewService;

@Controller
@RequestMapping("/news/newsView")
public class NewsViewController {
	
	@Autowired
	private NewsViewService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getNewsView(@RequestParam("n_no") int n_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("newsInfo", service.getNewsView(n_no));
		modelAndView.setViewName("news/newsView");
		
		return modelAndView;
		
	}

}

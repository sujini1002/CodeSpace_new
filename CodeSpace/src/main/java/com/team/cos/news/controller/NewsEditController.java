package com.team.cos.news.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.NewsEditService;
import com.team.cos.news.vo.NewsInfo;

@Controller
@RequestMapping("/news/newsEdit")
public class NewsEditController {

	@Autowired
	private NewsEditService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getNewsEdit(@RequestParam("n_no") int n_no) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("newsInfo", service.getNewsEdit(n_no));
		modelAndView.setViewName("news/newsEdit");

		return modelAndView;

	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView editNews(NewsInfo newsInfo, HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("newsInfo", service.editNews(newsInfo, request));
		modelAndView.setViewName("redirect:/news/news");
		
		return modelAndView;
		
	}
	
}

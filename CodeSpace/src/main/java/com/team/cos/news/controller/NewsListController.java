 package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.vo.PageMaker;
import com.team.cos.news.service.NewsListService;
import com.team.cos.news.vo.NewsCriteria;

@Controller
@RequestMapping("/news/news")
public class NewsListController {
	
	@Autowired
	private NewsListService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getNews(@ModelAttribute("cri") NewsCriteria cri) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", service.getNewsList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countNews(cri));
		
		modelAndView.addObject("pageMaker", pageMaker);
		
		modelAndView.setViewName("news/news");
		
		return modelAndView;
	}

}

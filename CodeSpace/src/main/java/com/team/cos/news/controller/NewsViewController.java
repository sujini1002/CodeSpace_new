package com.team.cos.news.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.NewsViewService;
import com.team.cos.news.service.NewsViewcntService;

@Controller
@RequestMapping("/news/newsView")
public class NewsViewController {
	
	@Autowired
	private NewsViewService service;
	
	@Autowired
	private NewsViewcntService viewService;
	
	// 게시글 보기
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getNewsView(@RequestParam("n_no") int n_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 조회수 증가
		viewService.n_viewcnt(n_no);
				
		modelAndView.addObject("newsInfo", service.getNewsView(n_no));
		//modelAndView.addObject("n_viewcnt", viewService.n_viewcnt(n_no));
		modelAndView.setViewName("news/newsView");
		
		return modelAndView;
		
	}
	
	

}

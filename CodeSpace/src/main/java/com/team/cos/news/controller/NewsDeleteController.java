package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.news.service.NewsDeleteService;

@Controller
@RequestMapping("/news/newsDelete")
public class NewsDeleteController {

	@Autowired
	private NewsDeleteService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String deleteNews(@RequestParam("n_no") int n_no) {
		
		service.deleteNews(n_no);
		return "redirect:/news/news";
		
	}

}

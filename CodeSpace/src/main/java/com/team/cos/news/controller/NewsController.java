package com.team.cos.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/news/news")
public class NewsController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String getNews() {
		
		return "news/news";
	}

}

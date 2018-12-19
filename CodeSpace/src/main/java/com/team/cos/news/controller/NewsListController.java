 package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.vo.PageMaker;
import com.team.cos.news.service.NewsCommListService;
import com.team.cos.news.service.NewsListService;
import com.team.cos.news.vo.NewsCriteria;

@Controller
@RequestMapping("/news/news")
public class NewsListController {
	
	@Autowired
	private NewsListService service;
	
	@Autowired
	private NewsCommListService commService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getNews(@ModelAttribute("cri") NewsCriteria cri) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 뉴스 정보 얻어오기
		modelAndView.addObject("list", service.getNewsList(cri));
		
		// 댓글 개수 얻어오기
		//modelAndView.addObject("commCnt", service.countComm());
				
		//페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countNews(cri));
		modelAndView.addObject("pageMaker", pageMaker);
		
		modelAndView.setViewName("news/news");
		
		
		return modelAndView;
	}

}

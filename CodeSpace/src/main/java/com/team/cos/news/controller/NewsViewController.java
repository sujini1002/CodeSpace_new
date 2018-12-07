package com.team.cos.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.NewsCommListService;
import com.team.cos.news.service.NewsViewService;
import com.team.cos.news.service.NewsViewcntService;
import com.team.cos.news.vo.NewsCommentInfo;

@Controller
@RequestMapping("/news/newsView")
public class NewsViewController {
	
	@Autowired
	private NewsViewService service;
	
	@Autowired
	private NewsViewcntService viewService;
	
	@Autowired
	private NewsCommListService commService;
	
	// 게시글 보기
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getNewsView(@RequestParam("n_no") int n_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 조회수 증가
		viewService.n_viewcnt(n_no);
		List<NewsCommentInfo> commList = commService.getCommList(n_no);
		
		
		// 뉴스 정보			
		modelAndView.addObject("newsInfo", service.getNewsView(n_no));
		
		// 댓글 정보
		modelAndView.addObject("commList", commList);
		
		modelAndView.setViewName("news/newsView");
		
		return modelAndView;
		
	}
	
	

}

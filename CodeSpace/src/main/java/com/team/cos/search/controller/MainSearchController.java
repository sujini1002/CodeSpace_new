package com.team.cos.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.search.service.MainSearchService;

@Controller
public class MainSearchController {
	
	@Autowired
	private MainSearchService searchService;
	
	@RequestMapping("/search/searchResults")
	public ModelAndView getMainSearch(@RequestParam("mainSearch") String keyword) {
		// 검색창으로 테스트 할때는 @RequestParam으로 검색창에 입력된 값을 넘겨 받아야 한다.
		// 우선은 페이지 이동 테스트부터
		
		System.out.println(keyword + " 확인");
		
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("searchResult", searchService.getSearchList());
		mav.addObject("searchResult", searchService.getSearchList(keyword));
		mav.addObject("searchCount", searchService.getSearchCnt(keyword));
		
		mav.setViewName("search/searchResults");
		
		
		return mav;
	}

}

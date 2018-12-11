package com.team.cos.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.search.service.MainSearchService;
import com.team.cos.paging.vo.PageMaker;
import com.team.cos.paging.vo.SearchCriteria;

@Controller
public class MainSearchController {

	@Autowired
	private MainSearchService searchService;

	/*
	@RequestMapping("/search/searchResults")
	public ModelAndView getMainSearch(@RequestParam("mainSearch") String keyword, SearchCriteria cri) {

		System.out.println("keyword : " + keyword);
		
		ModelAndView mav = new ModelAndView();

		// keyword 정보를 view에 넘겨준다.
		mav.addObject("keyword", keyword);
		
		// keyword로 검색 된 결과를 searchResult로 view에 넘겨준다.
		mav.addObject("searchResult", searchService.getSearchList(keyword));
		
		// 위의 결과 갯수를 Count한 결과를 넘겨준다.
		mav.addObject("searchCount", searchService.getSearchCnt(keyword));

		mav.setViewName("search/searchResults");		

		return mav;
	}
	*/
	
	@RequestMapping(value="/search/searchResults")
	public ModelAndView getSearchResults(@ModelAttribute("cri")SearchCriteria cri) {

		ModelAndView mav = new ModelAndView();
		

		mav.addObject("list", searchService.searchResult(cri));
		mav.addObject("keyword", cri.getKeyword());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearchCri(cri);
		
		pageMaker.setTotalCount(searchService.getSearchCnt(cri));
		
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("search/searchResults");
		
		return mav;

	}

}

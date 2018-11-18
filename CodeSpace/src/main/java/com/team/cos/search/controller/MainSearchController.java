package com.team.cos.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.search.service.MainSearchService;
import com.team.cos.search.service.PagingService;
import com.team.cos.search.vo.PageMaker;
import com.team.cos.search.vo.SearchCriteria;

@Controller
public class MainSearchController {

	@Autowired
	private MainSearchService searchService;

	@Autowired
	private PagingService pagingService;

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
		
		System.out.println(cri);
		///////////////////// paging //////////////////////
		
		System.out.println("검색 결과 쿼리 결과 : " + searchService.searchResult(cri));

		mav.addObject("list", searchService.searchResult(cri));
		mav.addObject("keyword", cri.getKeyword());
		

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(searchService.getSearchCnt(cri));
		
		System.out.println("pageMaker : " + pageMaker);

		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("search/searchResults");
		
		return mav;

	}


	@RequestMapping(value="/questions/questions")
	public ModelAndView getQuestions(@ModelAttribute("cri")SearchCriteria cri) {

		ModelAndView mav = new ModelAndView();

		///////////////////// paging //////////////////////

		mav.addObject("list", pagingService.listCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(pagingService.listCountCriteria(cri));

		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("questions/questions");
		
		return mav;

	}

}

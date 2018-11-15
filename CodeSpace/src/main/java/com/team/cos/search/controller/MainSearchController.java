package com.team.cos.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.search.service.MainSearchService;
import com.team.cos.search.service.PagingService;
import com.team.cos.search.vo.Criteria;
import com.team.cos.search.vo.PageMaker;

@Controller
public class MainSearchController {
	
	@Autowired
	private MainSearchService searchService;
	
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/search/searchResults")
	public ModelAndView getMainSearch(@RequestParam("mainSearch") String keyword) {
		
		System.out.println("keyword : " + keyword);
		
		ModelAndView mav = new ModelAndView();
		
		// keyword 정보를 view에 넘겨준다.
		mav.addObject("keyword", keyword);
		
		// keyword로 검색 된 결과를 searchResult로 view에 넘겨준다.
		mav.addObject("searchResult", searchService.getSearchList(keyword));
		// 위의 결과 갯수를 Count한 결과를 넘겨준다.
		mav.addObject("searchCount", searchService.getSearchCnt(keyword));
		
		
		///////////////////// paging //////////////////////
		
		Criteria cri = new Criteria();
		
		cri.setPage(1);
		cri.setPerPageNum(10);
		cri.setKeyword("for");
		
		mav.addObject("paging", pagingService.getPaging(cri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(131);
		
		
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("search/searchResults");
		
		
		return mav;
	}

}

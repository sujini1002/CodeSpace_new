package com.team.cos.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.paging.vo.PageMaker;
import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.search.service.TagSearchService;

@Controller
public class TagSearchController {
	
	@Autowired
	private TagSearchService searchService;
	
	@RequestMapping(value="/search/tagged")
	public ModelAndView getTagSearch(@ModelAttribute("cri")SearchCriteria cri) {

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", searchService.searchTag(cri));
		mav.addObject("tag", cri.getTag());
		

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearchCri(cri);
		
		pageMaker.setTotalCount(searchService.searchTagCnt(cri));
		
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("search/tagged");
		
		return mav;

	}

}

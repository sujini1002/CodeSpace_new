package com.team.cos.paging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.paging.service.PagingService;
import com.team.cos.paging.vo.PageMaker;
import com.team.cos.paging.vo.SearchCriteria;

@Controller
public class PagingController {

	@Autowired
	private PagingService pagingService;

	// Questions 페이지 결과에 대한 페이징 처리 ///////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/questions/questions")
	public ModelAndView getQuestions(@ModelAttribute("cri")SearchCriteria cri) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", pagingService.listCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearchCri(cri);
		
		pageMaker.setTotalCount(pagingService.listCountCriteria(cri));

		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("questions/questions");
		
		return mav;

	}

}

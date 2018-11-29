package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyBookmarkService;
import com.team.cos.mypage.vo.MyactCriteria;
import com.team.cos.mypage.vo.PageMaker;

@Controller
@RequestMapping("/mypage/myBookmark")
public class MyBookmarkController {

	@Autowired
	private MyBookmarkService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getMyBmark(@RequestParam("user_no") int user_no, @ModelAttribute("cri") MyactCriteria cri) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("myBmarkList",  service.getMyBmark(user_no, cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countMyBmark(user_no, cri));
		modelAndView.addObject("pageMaker", pageMaker);
		
		modelAndView.setViewName("mypage/myBookmark");
		return modelAndView;
	}
}

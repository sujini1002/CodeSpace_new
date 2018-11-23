package com.team.cos.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.vo.UsersPageMaker;
import com.team.cos.mypage.vo.UsersActCriteria;
import com.team.cos.user.service.UsersPageAService;

@Controller
@RequestMapping("/user/usersPageA")
public class UsersPageAController {

	@Autowired
	private UsersPageAService service;

	// 사용자에서 다른 사용자 눌렀을때
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getUsersPage(@RequestParam("user_no") int user_no, UsersActCriteria cri) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("user/usersPageA");
		modelAndView.addObject("usersInfo", service.getUsersPage(user_no));

		// 사용자가 한 질문 받아오기
		modelAndView.addObject("qstCnt", service.countUsersQst(user_no, cri));
		
		UsersPageMaker pageMaker = new UsersPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countUsersAns(user_no, cri));

		modelAndView.addObject("ansList", service.getUsersAns(user_no, cri));
		modelAndView.addObject("ansCnt", service.countUsersQst(user_no, cri));
		modelAndView.addObject("pageMaker", pageMaker);
		modelAndView.setViewName("user/usersPageA");
		

		//System.out.println("유저s페이지 컨트롤러 들어옴");
		return modelAndView;
	}
}

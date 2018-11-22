package com.team.cos.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.vo.UsersPageMaker;
import com.team.cos.mypage.vo.PageMaker;
import com.team.cos.mypage.vo.UsersActCriteria;
import com.team.cos.user.service.UsersPageService;

@Controller
@RequestMapping("/user/usersPage")
public class UsersPageController {

	@Autowired
	private UsersPageService service;

	// 사용자에서 다른 사용자 눌렀을때
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getUsersPage(@RequestParam("user_no") int user_no, UsersActCriteria cri) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("user/usersPage");
		modelAndView.addObject("usersInfo", service.getUsersPage(user_no));
		
		// System.out.println("사용자s 페이지 컨트롤러 들어오나");
		// System.out.println(service.getUsersPage(user_no));
		// System.out.println(service.getQstCnt(user_no, cri));
		// System.out.println(service.getAnsCnt(cri, user_no));

		// 사용자가 한 질문 받아오기
		modelAndView.addObject("usersQst", service.getUsersQst(user_no, cri));
		modelAndView.addObject("qstCnt", service.countUsersQst(user_no, cri));
		UsersPageMaker pageMakerQ = new UsersPageMaker();
		pageMakerQ.setCri(cri);
		pageMakerQ.setTotalCount(service.countUsersQst(user_no, cri));
		modelAndView.addObject("pageMaker", pageMakerQ);
		
		
		// 사용자가 한 답변 받아오기
		//UsersPageMaker pageMakerA = new UsersPageMaker();
		//pageMakerA.setCri(cri);
		//pageMakerA.setTotalCount(service.countUsersAns(user_no, cri));

		//modelAndView.addObject("usersAns", service.getUsersAns(user_no,cri));
		modelAndView.addObject("ansCnt", service.countUsersAns(user_no, cri));
		//modelAndView.addObject("pageMakerA", pageMakerA);
		
		return modelAndView;
	}
}

package com.team.cos.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.paging.service.PagingService;
import com.team.cos.paging.vo.PageMaker;
import com.team.cos.paging.vo.UserCriteria;
import com.team.cos.user.service.UserService;

@Controller
public class UserListController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PagingService pagingService;

	@RequestMapping(value="/user/userList", method=RequestMethod.GET)
	public ModelAndView getUserList(@ModelAttribute("cri")UserCriteria cri) {

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userList", userService.getUserList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setUserCri(cri);
		
		pageMaker.setUserTotalCount(userService.getUserCnt(cri));
		
		
		System.out.println("일반 리스트 페이징 값");
		System.out.println("totalCount : " + pageMaker.getTotalCount());
		System.out.println("userTotalCount : " + pageMaker.getUserTotalCount());
		System.out.println("startPage : " + pageMaker.getStartPage());
		System.out.println("endPage : " + pageMaker.getEndPage());
		System.out.println("prev : " + pageMaker.isPrev());
		System.out.println("next : " + pageMaker.isNext());
		System.out.println("searchCri : " + pageMaker.getSearchCri());
		System.out.println("userCri : " + pageMaker.getUserCri());
		
		
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("user/userList");
		
		return mav;
	
	}
	
	@RequestMapping(value="/user/search", method=RequestMethod.GET)
	@ResponseBody
	public List getUserSearch(@ModelAttribute("cri")UserCriteria cri) throws Exception {
		
		System.out.println(cri);
		
		List<Object> userInfo = new ArrayList();
		
		userInfo.add(userService.getUsers(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setUserCri(cri);
		
		pageMaker.setUserTotalCount(userService.getSearchCnt(cri));
		
		System.out.println("ajax 처리된 Paging 값");
		System.out.println("totalCount : " + pageMaker.getTotalCount());
		System.out.println("userTotalCount : " + pageMaker.getUserTotalCount());
		System.out.println("startPage : " + pageMaker.getStartPage());
		System.out.println("endPage : " + pageMaker.getEndPage());
		System.out.println("prev : " + pageMaker.isPrev());
		System.out.println("next : " + pageMaker.isNext());
		System.out.println("searchCri : " + pageMaker.getSearchCri());
		System.out.println("userCri : " + pageMaker.getUserCri());
		
		userInfo.add(pageMaker);
		
		System.out.println(userInfo);
		
		return userInfo;
		
	}

}

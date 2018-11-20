package com.team.cos.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.search.service.UserSearchService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserSearchController {
	
	@Autowired
	private UserSearchService searchService;
	
	/*
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getUserList() {

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userList", searchService.getUserList());
		mav.setViewName("search/userList");
		
		return mav;
		
	}
	
	*/
	/*
	@RequestMapping(value="/search/userList", method=RequestMethod.POST)
	@ResponseBody
	public List getSearchUser(@RequestParam("searchWords") String searchWords) {
		
		List<UserInfoVo> userInfo = searchService.getSearchUsers(searchWords);
		
		return userInfo;
	}
	*/
}

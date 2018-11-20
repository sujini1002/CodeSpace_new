package com.team.cos.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.user.service.UserService;

@Controller
public class UserListController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user/userList")
	public ModelAndView getUserList() {

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userList", userService.getUserList());
		mav.setViewName("user/userList");
		
		return mav;
	
	}
}

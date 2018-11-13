package com.team.cos.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MypageEditService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/mypage/editForm")
public class MypageEditController {

	@Autowired
	private MypageEditService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getEditForm(@RequestParam("user_id") String user_id) {

		ModelAndView modelAndView = new ModelAndView();
		UserInfoVo userInfoVo = service.getUserInfo(user_id);
		modelAndView.setViewName("mypage/editForm");
		modelAndView.addObject("userInfoVo", userInfoVo);
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView editMypage() {
		
		ModelAndView modelAndView = new ModelAndView();
		

		
		return modelAndView;
	}
}

package com.team.cos.userinfo.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.userinfo.service.UserInfoChangePwService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserInfoChangePwController {

	@Autowired
	private UserInfoChangePwService service;

	@RequestMapping(value = "/userinfo/changepw", method = RequestMethod.GET)
	public ModelAndView getChangePw(UserInfoVo userInfoVo) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("userinfo/changepw");
		modelAndView.addObject("userInfoVo", userInfoVo);
		return modelAndView;
	}

	@RequestMapping(value = "/userinfo/changepw", method = RequestMethod.POST)
	@ResponseBody
	public String postChangePw(UserInfoVo userInfoVo)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		int result = service.changePw(userInfoVo);
		if (result > 0) {
			return "success";
		}
		return "fail";

	}
}

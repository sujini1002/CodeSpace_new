package com.team.cos.userinfo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.userinfo.service.SimpleRegistrationNotifierService;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.service.UserInfoRegService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/userinfo/userreg")
public class UserInfoRegController {
	@Autowired
	private UserInfoRegService service;
	@Autowired
	private UserInfoCheckService checkService;
	@Autowired
	private SimpleRegistrationNotifierService mailService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView insertUserInfoform(UserInfoVo userInfoVo, HttpSession session) {
		UserInfoVo result = checkService.userInfoCheck(userInfoVo);
		session.setAttribute("loginInfo", userInfoVo);
		session.setAttribute("result", result);
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("userInfoVo", userInfoVo);
		modelAndView.setViewName("/userinfo/userreg");
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView insertUserInfo(UserInfoVo userInfoVo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView();

		int result = service.insertUserInfo(userInfoVo, request);

		if (result == 0) {
			// 등록이 제대로 안됐을 때
			modelAndView.setViewName("userinfo/reconfirm");
		} else {
			mailService.sendMail(userInfoVo);
			modelAndView.setViewName("home");
			session.setAttribute("loginInfo", userInfoVo);
			session.removeAttribute("result");
		}

		return modelAndView;
	}
}

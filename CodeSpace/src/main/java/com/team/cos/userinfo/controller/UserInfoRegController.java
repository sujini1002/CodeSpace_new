package com.team.cos.userinfo.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.userinfo.service.AES256UtilService;
import com.team.cos.userinfo.service.SimpleRegistrationNotifierService;
import com.team.cos.userinfo.service.UserInfoRegService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping(value = "/userinfo/userreg")
public class UserInfoRegController {
	@Autowired
	private UserInfoRegService service;
	@Autowired
	private AES256UtilService enService;
	@Autowired
	private SimpleRegistrationNotifierService mailService;

	@RequestMapping(method = RequestMethod.GET)
	public String insertUserInfoform(UserInfoVo userInfoVo, HttpSession session) {
		return "userinfo/userreg";
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public String insertUserInfo(UserInfoVo userInfoVo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException, NoSuchAlgorithmException, GeneralSecurityException {
//		ModelAndView modelAndView = new ModelAndView();
		userInfoVo.setUser_pw(enService.encrypt(userInfoVo.getUser_pw()));

		int result = service.insertUserInfo(userInfoVo, request);

		if (result == 0) {
			// 등록이 제대로 안됐을 때
//			modelAndView.setViewName("userinfo/reconfirm");
			return "0";
		} else {
//			메일 서비스
			mailService.sendMail(userInfoVo);
//			modelAndView.setViewName("redirect:/");
			session.setAttribute("loginInfo", userInfoVo);
			return "1";
		}

//		return modelAndView;
	}
}

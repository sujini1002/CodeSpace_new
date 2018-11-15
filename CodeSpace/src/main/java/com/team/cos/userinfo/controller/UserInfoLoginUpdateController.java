package com.team.cos.userinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.service.UserInfoLoginUpdateService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserInfoLoginUpdateController {
	@Autowired
	private UserInfoLoginUpdateService service;
	@Autowired
	private UserInfoCheckService checkService;

	@RequestMapping("/userinfo/userloginupdate")
	@ResponseBody
	public void userLoginUpdate(UserInfoVo userInfoVo, HttpSession session) {
		UserInfoVo result = checkService.userInfoCheck(userInfoVo);
		service.userLoginUpdate(userInfoVo);
		session.setAttribute("loginInfo", result);
	}
}

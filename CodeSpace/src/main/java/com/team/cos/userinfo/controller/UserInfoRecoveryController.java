package com.team.cos.userinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.userinfo.service.SimpleRegistrationNotifierService;
import com.team.cos.userinfo.service.UserInfoRecoveryService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserInfoRecoveryController {
	@Autowired
	private SimpleRegistrationNotifierService service;

	@RequestMapping(value = "/userinfo/recovery", method = RequestMethod.GET)
	public String recovery(UserInfoVo userInfoVo) {
		return "userinfo/recovery";
	}

//	이메일로 비빌번호 초기화 메일 보내기
	@RequestMapping(value = "/userinfo/recovery", method = RequestMethod.POST)
	@ResponseBody
	public String sendRecvMail(UserInfoVo userInfoVo) {
		int result = service.sendRecoveryMail(userInfoVo);
		return result + "";

	}
}

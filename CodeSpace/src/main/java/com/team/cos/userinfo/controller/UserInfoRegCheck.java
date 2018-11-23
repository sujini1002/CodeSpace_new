package com.team.cos.userinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserInfoRegCheck {
	@Autowired
	private UserInfoCheckService service;

	@RequestMapping(value = "/userinfo/useridcheck", method = RequestMethod.POST)
	@ResponseBody
	public UserInfoVo userIdCheck(UserInfoVo userInfoVo) {
		UserInfoVo result = new UserInfoVo();
		result = service.userInfoCheck(userInfoVo);
		if (result == null) {
			UserInfoVo result2 = new UserInfoVo();
			return result2;
		}
		return result;
	}
}

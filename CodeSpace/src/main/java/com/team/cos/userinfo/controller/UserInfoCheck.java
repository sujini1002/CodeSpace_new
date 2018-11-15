package com.team.cos.userinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class UserInfoCheck {
	@Autowired
	private UserInfoCheckService service;

	@RequestMapping("/userinfo/usercheck")
	@ResponseBody
	public UserInfoVo userInfoCheck(UserInfoVo userInfoVo, HttpSession session) {
		UserInfoVo result = service.userInfoCheck(userInfoVo);

		if (result == null) {
			result = new UserInfoVo();
			result.setUser_id(userInfoVo.getUser_id());
		}
		
		session.setAttribute("googlecheck", result.getUser_id());

		return result;
	}
}

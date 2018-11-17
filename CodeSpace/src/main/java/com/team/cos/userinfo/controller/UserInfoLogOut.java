package com.team.cos.userinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserInfoLogOut {
	@RequestMapping("/userinfo/userlogout")
	@ResponseBody
	public void userInfoLogOut(HttpSession session) {
		session.invalidate();
	}
}

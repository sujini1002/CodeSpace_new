package com.team.cos.userinfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.userinfo.service.UserInfoLoginUpdateService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/userinfo/userlogin")
public class UserInfoLoginCheck {

	@Autowired
	private UserInfoLoginUpdateService updateService;

	@RequestMapping(method = RequestMethod.GET)
	public String getUserInfoLogin() {
		return "userinfo/userlogin";
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public int postUserInfoLogin(UserInfoVo userInfoVo,HttpSession session) {
		UserInfoVo result = new UserInfoVo();
		result = updateService.userLoginCheck(userInfoVo);
		
		System.out.println(userInfoVo);
		System.out.println(result);
		
		if (result.getUser_pw() == null) {
//			pw 가 없으면 구글 로그인
			return 1;
		} else if (userInfoVo.getUser_id().equals(result.getUser_id()) && userInfoVo.getUser_pw().equals(result.getUser_pw())) {
//			사용자 제대로 확인 되었을떄
			updateService.userLoginUpdate(userInfoVo);
			session.setAttribute("loginInfo", result);
			return 2;
		}else {
			return 0;
		}

	}
}

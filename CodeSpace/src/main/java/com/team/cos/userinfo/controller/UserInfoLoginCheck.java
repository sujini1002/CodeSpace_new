package com.team.cos.userinfo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.userinfo.service.UserInfoLoginUpdateService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/userinfo/userlogin")
public class UserInfoLoginCheck {

	@Autowired
	private UserInfoLoginUpdateService updateService;

	@RequestMapping(method = RequestMethod.GET)
	public String getUserInfoLogin(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookie = request.getCookies();
		return "userinfo/userlogin";
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public int postUserInfoLogin(UserInfoVo userInfoVo, HttpSession session, boolean user_cookie,
			HttpServletResponse response) {
		UserInfoVo result = new UserInfoVo();
		result = updateService.userLoginCheck(userInfoVo);

		if (result.getUser_pw() == null) {
//			pw 가 없으면 구글 로그인
			return 1;
		} else if (userInfoVo.getUser_id().equals(result.getUser_id())
				&& userInfoVo.getUser_pw().equals(result.getUser_pw())) {
//			사용자 제대로 확인 되었을떄
//			쿠키가 있을때 쿠키 저장후 response
			if (user_cookie == true) {
				Cookie cookie = new Cookie("user_id", result.getUser_id());
				response.addCookie(cookie);
			}
			updateService.userLoginUpdate(userInfoVo);
			session.setAttribute("loginInfo", result);
			return 2;
		} else {
			return 0;
		}
	}
}

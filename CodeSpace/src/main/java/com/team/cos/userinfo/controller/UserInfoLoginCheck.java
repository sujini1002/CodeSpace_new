package com.team.cos.userinfo.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.userinfo.service.AES256UtilService;
import com.team.cos.userinfo.service.UserInfoLoginUpdateService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/userinfo/userlogin")
public class UserInfoLoginCheck {

	@Autowired
	private UserInfoLoginUpdateService updateService;
	@Autowired
	private AES256UtilService enService;

	@RequestMapping(method = RequestMethod.GET)
	public String getUserInfoLogin(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookie = request.getCookies();
		return "userinfo/userlogin";
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public int postUserInfoLogin(UserInfoVo userInfoVo, HttpSession session, boolean user_cookie,
			HttpServletResponse response)
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		UserInfoVo result = new UserInfoVo();
		userInfoVo.setUser_pw(enService.encrypt(userInfoVo.getUser_pw()));

		result = updateService.userLoginCheck(userInfoVo);
		if (result == null) {
			return 3;
		} else if (result.getUser_pw() == null) {
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

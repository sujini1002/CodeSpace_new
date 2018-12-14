package com.team.cos.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MypageEditService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/mypage/editForm")
public class MypageEditController {

	@Autowired
	private MypageEditService service;

	// 해당 id로 수정폼 연결하기
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getEditForm(@RequestParam("user_id") String user_id) {

		ModelAndView modelAndView = new ModelAndView();
		UserInfoVo userInfoVo = service.getUserInfo(user_id);
		modelAndView.setViewName("mypage/editForm");
		modelAndView.addObject("userInfoVo", userInfoVo);
		return modelAndView;
	}

	// 수정하고 수정완료 버튼 눌렀을때
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public String editMypage(UserInfoVo userInfoVo, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {

		ModelAndView modelAndView = new ModelAndView();

		int result = service.edit(userInfoVo, request);
		String result2;
		session.setAttribute("loginInfo", userInfoVo);
//		modelAndView.setViewName("redirect:/mypage/mypage");

		if (result == 0) {
			return result2 = "0";
		} else {
			return result2 = "1";
		}
//		return result;

	}
}

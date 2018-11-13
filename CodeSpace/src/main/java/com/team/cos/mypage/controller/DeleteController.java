package com.team.cos.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.DeleteService;

@Controller
public class DeleteController {

	@Autowired
	private DeleteService service;

	@RequestMapping(value="/mypage/delete-acconut",method = RequestMethod.GET)
	public String getDeleteForm() {
		return "mypage/delete-account";
	}

	// 삭제하기 버튼 눌렀을때 아이디 확인하기
	@RequestMapping(value="/mypage/delete-acconut",method = RequestMethod.POST)
	public String delete(String user_id, HttpSession session) {

		service.delete(user_id, session);

		return "redirect:/";

	}
}

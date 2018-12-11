package com.team.cos.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.DeleteService;

@Controller
@RequestMapping("/mypage/delete")
public class DeleteController {

	@Autowired
	private DeleteService service;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getDeleteForm(String user_id) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("mypage/delete");
		modelAndView.addObject("user_id", user_id); // 로그인한 회원 정보 -> 사용자 id값 확인하는 페이지 넘어갈 때 파라미터로 전달
		return modelAndView;
	}

	// 삭제하기 버튼 눌렀을때 아이디 확인하기
	@RequestMapping(method = RequestMethod.POST)
	public String delete(String inputuser_id, 
			String user_id,
			HttpSession session) throws IOException {

		service.delete(inputuser_id, user_id, session);

		return "redirect:/";

	}
}

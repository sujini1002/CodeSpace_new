package com.team.cos.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage/mypage")
	public String getMypage() {
		
		return "mypage/mypage";
	}
}

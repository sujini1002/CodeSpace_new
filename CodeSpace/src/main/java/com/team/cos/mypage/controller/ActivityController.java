package com.team.cos.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ActivityController {

	@RequestMapping("/mypage/activity")
	public String getActivity() {
		
		return "mypage/activity";
		
	}
}

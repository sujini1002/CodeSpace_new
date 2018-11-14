package com.team.cos.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserpageController {

	
	/*경로 꼬이니까 /mypage/ 말고 다른 이름으로 바꾸기*/
	/*@RequestMapping("/mypage/{user_no}")
	public String getUsersPage(@PathVariable("user_no") int user_no, Model model) {
		
		return null;
	}*/
}

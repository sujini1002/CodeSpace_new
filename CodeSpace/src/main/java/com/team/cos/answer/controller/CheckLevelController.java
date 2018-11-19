package com.team.cos.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.answer.service.CheckLevelService;

@Controller
public class CheckLevelController {
	
	@Autowired
	private CheckLevelService service;
	
	@RequestMapping(value="/answer/checkLevel", method = RequestMethod.GET)
	@ResponseBody
	public String checkLevel(@RequestParam("user_no")int user_no) {
		
		
		
		boolean result = service.checkLevel(user_no);
		
		System.out.println("result="+result);
		
		//JSON  형식으로 저장
		String resultJson = "{\"result\": \"" +result + "\"}";

		
		return resultJson;
	}
}

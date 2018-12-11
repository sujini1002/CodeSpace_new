package com.team.cos.choose.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.choose.service.AnswerChooseService;

@Controller
public class AnswerChooseController {
	
	@Autowired
	private AnswerChooseService service;
	
	@RequestMapping(value="/answer/answerChoose",method=RequestMethod.GET)
	@ResponseBody
	public String choose(@RequestParam("a_no")int a_no) {
		
		int q_no = service.selectQNo(a_no);
		int user_no = service.findUser(a_no);
		String result = "";
		
		if(service.isExistChoose(q_no)==0) {
			service.Choose(a_no);
			service.updateUserScore(user_no);
			result =  "{\"message\": \"" + 1 + "\"}";
		}else {
			result = "{\"message\": \"" + 0 + "\"}";
		}
		return result;
	}
}

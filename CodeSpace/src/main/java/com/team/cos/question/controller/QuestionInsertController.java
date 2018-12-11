package com.team.cos.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.question.serivce.QuestionInsertService;
import com.team.cos.question.vo.QuestionInfo;

@Controller
@RequestMapping("/question/insertQuestion")
public class QuestionInsertController {
	
	@Autowired
	private QuestionInsertService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String insertForm() {
		return "/question/insertForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String insertQuestion(QuestionInfo questionInfo) {
		
		
		//질문등록
		service.insertQuestion(questionInfo);
		
		//질문번호 출력
		int q_no = service.questionSelectNum();
		
		//작성자 스코어 값 1증가하는 컨트롤러로 들어가기
		return "redirect:/question/userscore?q_no="+q_no+"&score=1";
		
		
	}
}

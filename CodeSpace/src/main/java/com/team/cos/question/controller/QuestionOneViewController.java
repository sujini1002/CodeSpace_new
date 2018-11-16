package com.team.cos.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.answer.service.AnswerListService;
import com.team.cos.answer.vo.AnswerInfo;
import com.team.cos.question.serivce.QuestionOneViewService;
import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/question/questionView")
public class QuestionOneViewController {
	
	@Autowired
	private QuestionOneViewService questionService;
	
	@Autowired
	private AnswerListService answerService;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView questionView(@RequestParam("q_no")int q_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		QuestionInfo questionInfo = questionService.questionView(q_no);
		UserInfoVo userInfoVo = questionService.questionUser(q_no);
		
		//답변
		List<AnswerInfo> answerList = answerService.listAnswer(q_no);
		
		modelAndView.addObject("questionInfo", questionInfo);
		modelAndView.addObject("userInfo", userInfoVo);
		modelAndView.addObject("answerList", answerList);
		modelAndView.setViewName("question/questionOneView");
		
		System.out.println("컨트롤러"+answerList);
		
		return modelAndView;
	}
}

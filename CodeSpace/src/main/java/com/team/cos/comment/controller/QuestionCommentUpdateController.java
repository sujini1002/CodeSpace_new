package com.team.cos.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.QuestionCommentUpdateService;
import com.team.cos.comment.vo.QuestionCommentInfo;

@Controller
public class QuestionCommentUpdateController {
	
	@Autowired
	private QuestionCommentUpdateService service;
	
	@RequestMapping(value="/questionComm/updateComm",method=RequestMethod.POST)
	@ResponseBody
	public List<QuestionCommentInfo> update(QuestionCommentInfo questionCommentInfo){
		
		int result = service.updateQc(questionCommentInfo);
		
		return service.listAll(questionCommentInfo.getQc_no());
	}
	
}

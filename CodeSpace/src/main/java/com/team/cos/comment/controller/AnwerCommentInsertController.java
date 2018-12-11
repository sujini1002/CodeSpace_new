package com.team.cos.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.AnswerCommentInsertService;
import com.team.cos.comment.vo.AnswerCommentInfo;

@Controller
public class AnwerCommentInsertController {
	
	@Autowired
	private AnswerCommentInsertService service;
	
	@RequestMapping(value="/answerComm/insertComment",method=RequestMethod.POST)
	@ResponseBody
	public List<AnswerCommentInfo> insert(AnswerCommentInfo answerCommentInfo){
		
		service.insert(answerCommentInfo);
		
		
		return service.listAll(answerCommentInfo.getA_no());
	}
	
}

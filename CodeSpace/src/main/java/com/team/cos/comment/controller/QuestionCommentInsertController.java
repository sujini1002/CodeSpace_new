package com.team.cos.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.QuestionCommentInsertService;
import com.team.cos.comment.vo.QuestionCommentInfo;

@Controller
public class QuestionCommentInsertController {
	
	@Autowired
	private QuestionCommentInsertService service;
	
	@RequestMapping(value="/questionComm/insertComment",method=RequestMethod.POST)
	@ResponseBody
	public List<QuestionCommentInfo> insert(QuestionCommentInfo questionCommentInfo){
		
		service.insertComm(questionCommentInfo);
		List<QuestionCommentInfo> questCommList = service.selectList(questionCommentInfo.getQ_no());
		
		return questCommList;
	}
}

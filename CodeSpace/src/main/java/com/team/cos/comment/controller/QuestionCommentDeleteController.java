package com.team.cos.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.QuestionCommentDeleteService;
import com.team.cos.comment.vo.QuestionCommentInfo;

@Controller
public class QuestionCommentDeleteController {
	
	@Autowired
	private QuestionCommentDeleteService service;
	
	@RequestMapping(value="/questionComm/deleteComm",method=RequestMethod.GET)
	@ResponseBody
	public List<QuestionCommentInfo> deleteComment(@RequestParam("qc_no")int qc_no,@RequestParam("q_no")int q_no) {
		
		 //삭제
		 service.delete(qc_no);
		
		 return service.listAll(q_no);
	}
}

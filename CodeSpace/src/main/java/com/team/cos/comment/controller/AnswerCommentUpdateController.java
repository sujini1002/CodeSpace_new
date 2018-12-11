package com.team.cos.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.AnswerCommentUpdateService;
import com.team.cos.comment.vo.AnswerCommentInfo;

@Controller
public class AnswerCommentUpdateController {
	
	@Autowired
	private AnswerCommentUpdateService service;
	
	@RequestMapping(value="/answerComm/updateComment",method=RequestMethod.POST)
	@ResponseBody
	public List<AnswerCommentInfo> update(AnswerCommentInfo answerCommentInfo){
		
		//수정
		service.update(answerCommentInfo);
		//수정한 댓글의 답변 번호
		int a_no = service.findAnswerNum(answerCommentInfo.getAc_no());
		
		return service.listAll(a_no);
	}
}

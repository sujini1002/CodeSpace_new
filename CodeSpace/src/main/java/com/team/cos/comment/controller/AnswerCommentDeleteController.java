package com.team.cos.comment.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.comment.service.AnswerCommentDeleteService;
import com.team.cos.comment.vo.AnswerCommentInfo;

@Controller
public class AnswerCommentDeleteController {
	
	@Autowired
	private AnswerCommentDeleteService service;
	
	@RequestMapping(value="/answerComm/deleteComment",method=RequestMethod.GET)
	@ResponseBody
	public List<AnswerCommentInfo> delete(@RequestParam("ac_no")int ac_no){
		
		int a_no = service.findANum(ac_no);
		
		//삭제
		service.delete(ac_no);
		
		int count = service.count(a_no);
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		
		if(count >0) {
			list = service.listAll(a_no);
		}else {
			AnswerCommentInfo answer = new AnswerCommentInfo();
			answer.setA_no(a_no);
			answer.setAc_no(0);
			list.add(answer);
		}
		
		
		
		return list;
	}
}

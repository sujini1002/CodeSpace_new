package com.team.cos.comment.controller;

import java.util.ArrayList;
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
		
		System.out.println("컨트롤러 답변 댓글 고유 번호 딜리트="+ac_no);
		int a_no = service.findANum(ac_no);
		System.out.println("컨트롤러 답변  고유 번호 딜리트="+a_no);
		
		//삭제
		service.delete(ac_no);
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		list = service.listAll(a_no);
		System.out.println("컨트롤러 답변  댓글 삭제후 리스트 딜리트="+list);
		
		return list;
	}
}

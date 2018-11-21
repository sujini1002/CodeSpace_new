package com.team.cos.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.answer.service.AnswerListService;
import com.team.cos.answer.service.AnswerUserInfoService;
import com.team.cos.answer.vo.AnswerInfo;
import com.team.cos.comment.service.AnswerCommentListService;
import com.team.cos.comment.service.QuestionCommentListService;
import com.team.cos.comment.vo.AnswerCommentInfo;
import com.team.cos.comment.vo.QuestionCommentInfo;
import com.team.cos.question.serivce.QuestionOneViewService;
import com.team.cos.question.serivce.QuestionViewCntService;
import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/question/questionView")
public class QuestionOneViewController {
	
	@Autowired
	private QuestionOneViewService questionService;
	
	@Autowired
	private AnswerListService answerService;
	
	@Autowired
	private AnswerUserInfoService answerUserService;
	
	@Autowired
	private QuestionCommentListService qListService;
	
	@Autowired
	private AnswerCommentListService acListService;
	
	@Autowired
	private QuestionViewCntService viewCntService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView questionView(@RequestParam("q_no")int q_no,
									@RequestParam(value="order",defaultValue="score")String order,
									@RequestParam(value="viewCnt",defaultValue="true")boolean viewCnt) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		//조회수 증가
		if(viewCnt) {
			viewCntService.viewCnt(q_no);
		}
		
		QuestionInfo questionInfo = questionService.questionView(q_no);
		UserInfoVo userInfoVo = questionService.questionUser(q_no);
		
		//답변
		List<AnswerInfo> answerList = answerService.listAnswer(q_no,order);
		
		//답변 작성자들 리스트
		List<UserInfoVo> userInfoList = answerUserService.answerUserList(q_no,order);
		
		//질문 댓글
		List<QuestionCommentInfo> questionCommList = qListService.selectList(q_no);
		
		//답변 댓글
		List<AnswerCommentInfo> answerCommList = acListService.answerList(q_no);
		
		modelAndView.addObject("questionInfo", questionInfo);
		modelAndView.addObject("userInfo", userInfoVo);
		modelAndView.addObject("answerList", answerList);
		modelAndView.addObject("userInfoList", userInfoList);
		modelAndView.addObject("questionCommList", questionCommList);
		modelAndView.addObject("answerCommentList", answerCommList);
		modelAndView.setViewName("question/questionOneView");
		
		//System.out.println("컨트롤러"+userInfoList);
		
		return modelAndView;
	}
}

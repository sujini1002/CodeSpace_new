package com.team.cos.news.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.CommInsertService;
import com.team.cos.news.vo.NewsCommentInfo;

@Controller
@RequestMapping("/news/comment")
public class CommInsertController {

	@Autowired
	private CommInsertService service;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getComm() {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("news/comment");
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView writeComm(NewsCommentInfo newsCommentInfo) {

		ModelAndView modelAndView = new ModelAndView();

		// 정상처리 된 경우 다시 게시글 리스트로
		modelAndView.setViewName("redirect:/news/newsView");

		int resultCnt;
		resultCnt = service.writeComm(newsCommentInfo);

		if (resultCnt < 1) {
			modelAndView.setViewName("news/regFail");
		} else {
			modelAndView.setViewName("redirect:/");
		}
		return modelAndView;
	}
}

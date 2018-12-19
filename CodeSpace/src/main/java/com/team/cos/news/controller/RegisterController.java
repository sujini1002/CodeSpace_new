package com.team.cos.news.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.RegisterService;
import com.team.cos.news.vo.NewsInfo;

@Controller
@RequestMapping("/news/register")
public class RegisterController {
	
	@Autowired
	private RegisterService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getWritePage() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("news/register");
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView writeNews(NewsInfo newsInfo) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 정상처리 된 경우 다시 게시글 리스트로
		modelAndView.setViewName("redirect:/news/news");
		
		int resultCnt;
		
		try {
			resultCnt = service.writeNews(newsInfo);
			if (resultCnt < 1) {
				modelAndView.setViewName("news/regFail");
			} else {
				modelAndView.setViewName("redirect:/news/news");
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
}

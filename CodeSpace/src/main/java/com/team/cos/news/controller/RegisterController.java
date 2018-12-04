package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.NewsViewService;

@Controller
@RequestMapping("/news/register")
public class RegisterController {
	
		
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getWritePage() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		modelAndView.setViewName("news/register");
		return modelAndView;
	}
	
		
	
}

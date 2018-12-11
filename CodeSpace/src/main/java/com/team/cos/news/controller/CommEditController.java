package com.team.cos.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.news.service.CommDeleteService;
import com.team.cos.news.service.CommEditService;
import com.team.cos.news.service.NewsCommListService;
import com.team.cos.news.vo.NewsCommentInfo;

@Controller
@RequestMapping(value="/news/commEdit")
public class CommEditController {
	
	@Autowired
	private CommEditService service;
		
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String commEdit(NewsCommentInfo newsCommentInfo) {
		
		int result = service.editComm(newsCommentInfo);
		
		String json = "{\"message\": \"" +result + "\"}"; // 확인용
		return json;  
	}

}

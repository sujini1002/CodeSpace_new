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
	
	
	
/*	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getComm(@RequestParam("nc_no") int nc_no) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		NewsCommentInfo comm = service.getComm(nc_no);
		modelAndView.addObject("comm", comm);
		modelAndView.setViewName("news/commEdit");
		
		return modelAndView;
	}*/
	
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String commEdit(NewsCommentInfo newsCommentInfo) {
		
		/*System.out.println("댓글 수정 Post 컨트롤러 : "+ nc_no );
		int nno = service.selectNum(nc_no);
		service.editComm(newsCommentInfo);
		
		return "redirect:/news/newsView?n_no="+nno;*/
		
		//System.out.println("댓글 수정 post 컨트롤러");
		//System.out.println(newsCommentInfo);
		
		int result = service.editComm(newsCommentInfo);
		
		
		String json = "{\"message\": \"" +result + "\"}";
		return json;  
	}

}

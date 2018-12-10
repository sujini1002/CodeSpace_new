package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.news.service.CommDeleteService;

@Controller
@RequestMapping("/news/commDelete")
public class CommDeleteController {
	
	@Autowired
	private CommDeleteService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String deleteComm(@RequestParam("nc_no") int nc_no ) {
		
		int nno = service.selectNum(nc_no);
		service.deleteComm(nc_no);
		
		return "redirect:/news/newsView?n_no="+nno;
	}

}

package com.team.cos.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("project/tdlDashboard")
public class TdlDashboardController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getTdlList(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("/project/tdlDashboard");
		
		return modelAndView;
		
		
		
	}
	

}

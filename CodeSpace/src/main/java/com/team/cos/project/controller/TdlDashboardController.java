package com.team.cos.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.vo.ProjectInfoVO;

@Controller
@RequestMapping("project/tdlDashboard")
public class TdlDashboardController {
	
	@Autowired
	ProjectRegService regService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getTdlList(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		
		ProjectInfoVO pro_info = regService.selectProList(project_no);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("pro_info", pro_info );
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("/project/tdlDashboard");
		
		return modelAndView;
		
		
		
	}
	

}

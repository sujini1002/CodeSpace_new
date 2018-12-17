package com.team.cos.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectMemberDeleteService;

@Controller
@RequestMapping("/project/projectMemberDelete")
public class ProjectMemberDeleteController {
	
	@Autowired
	private ProjectMemberDeleteService memberDelete;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView deleteMember(
			@RequestParam("member_no") int member_no,
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {

		memberDelete.deleteMember(member_no);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);	
		modelAndView.setViewName("redirect:prjdash");
		
		return modelAndView;
	}

}

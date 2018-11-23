package com.team.cos.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectStatusChangeService;

@Controller
@RequestMapping("/project/projectFinish")
public class ProjectFinishController {
	
	@Autowired
	private ProjectStatusChangeService proFinService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView projectFin(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		
		int proFin = proFinService.changeToFinish(project_no);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("redirect:prjreg");
		return modelAndView;
	}
	
	

}

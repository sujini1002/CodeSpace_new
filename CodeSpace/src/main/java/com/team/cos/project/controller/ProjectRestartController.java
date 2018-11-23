package com.team.cos.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.ProjectStatusChangeService;
import com.team.cos.project.vo.ProjectInfoVO;

@Controller
@RequestMapping("/project/projectRestart")
public class ProjectRestartController {
	@Autowired
	private ProjectRegService service;

	@Autowired
	private ProjectStatusChangeService statusChangeService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView projectRestart(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no,
			@RequestParam("prostring_enddate") String prostring_enddate) throws ParseException {
		
		
		// 입력폼으로부터 전달받은 prostring_enddate, 종료일자 포맷 변경을 위한 처리
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(prostring_enddate);
				
		ProjectInfoVO pro_info = service.selectProList(project_no);
		pro_info.setProject_enddate(to);
		
		statusChangeService.changeToStart(pro_info);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("redirect:prjreg");
		return modelAndView;
	}
	
}

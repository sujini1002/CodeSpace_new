package com.team.cos.project.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("project/tdlDashboard")
public class TdlDashboardController {
	
	@Autowired
	ProjectRegService regService;
	@Autowired
	private UserInfoCheckService userInfoService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getTdlList(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		
		ProjectInfoVO pro_info = regService.selectProList(project_no);
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// 시작일, 종료일 표출을 위한 처리
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String project_startdate="";
		String project_enddate="";
						
		project_startdate = transFormat.format(pro_info.getProject_startdate());
		project_enddate = transFormat.format(pro_info.getProject_enddate());
		pro_info.setProstring_startdate(project_startdate);
		pro_info.setProstring_enddate(project_enddate);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("pro_info", pro_info );
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		// login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		modelAndView.setViewName("/project/tdlDashboard");
		
		return modelAndView;
		
		
		
	}
	

}

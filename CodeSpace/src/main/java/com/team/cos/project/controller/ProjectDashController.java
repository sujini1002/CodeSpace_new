package com.team.cos.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.UserProjectViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/prjdash")
public class ProjectDashController {
	
	@Autowired
	private ProjectRegService proInfoservice;

	@Autowired
	private UserInfoCheckService userInfoService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getProDashboard(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		System.out.println("project dashboard controller!");
		
		//user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		System.out.println("PDC userInfo = "+user_info.getUser_id());
		
		//project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		
		
		ModelAndView modelAndView = new ModelAndView();
		//login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		//project 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		modelAndView.setViewName("project/projectDashboard");
	
		return modelAndView;
	}

}

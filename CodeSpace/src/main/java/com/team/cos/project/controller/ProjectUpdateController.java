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

import com.team.cos.project.service.ProjectModifyService;
import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.ProjectRevisionService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.userinfo.service.UserInfoCheckService;

@Controller
@RequestMapping("/project/projectUpdate")
public class ProjectUpdateController {

	// update나 delete는 transaction 처리 필요

	@Autowired
	private ProjectRegService service;
	@Autowired
	private ProjectModifyService projectModifyService;
	@Autowired
	private UserInfoCheckService userInfoService;
	@Autowired
	private ProjectRevisionService revisionService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getUpdateForm(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no
			) {

		// project_no에 해당하는 정보 저장하여 projectModifyForm에 뿌려줄 예정
		ProjectInfoVO pro_info = service.selectProList(project_no);
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String start="";
		String end="";
		start = transFormat.format(pro_info.getProject_startdate());
		end = transFormat.format(pro_info.getProject_enddate());
		pro_info.setProstring_startdate(start);
		pro_info.setProstring_enddate(end);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pro_info", pro_info);
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("project/projectModifyForm");

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView UpdateProInfo(
			ProjectInfoVO vo,
			@RequestParam("user_no") int user_no
			) throws ParseException {
		// project 정부 수정하기 전에 project_no에 해당하는 데이터를 revision_project 테이블에 추가
		revisionService.insertRevisionProject(vo.getProject_no());
		
		String enddate = vo.getProstring_enddate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(enddate);

		vo.setProject_enddate(to);
		
		projectModifyService.modifyProInfo(vo);		

		ModelAndView modelAndView = new ModelAndView();
		//projectDashController로 project_no, user_no 값 보냄
		modelAndView.addObject("project_no", vo.getProject_no());
		modelAndView.addObject("user_no", user_no);		
		
		modelAndView.setViewName("redirect:prjdash");
		return modelAndView;
	}

}

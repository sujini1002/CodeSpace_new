package com.team.cos.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.calendar.Vo.calendarVo;
import com.team.cos.project.service.ProjectMemberListGetService;
import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.calendarViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class ProjectDashController {

	@Autowired
	private calendarViewService service; // 이거 달력임!!!!!!!!!!!!!!!

	@Autowired
	private ProjectRegService proInfoservice;
	@Autowired
	private UserInfoCheckService userInfoService;
	@Autowired
	private ProjectMemberListGetService proMemberService;

//	@RequestMapping("/project/prjdash")
	@RequestMapping(value = "/project/prjdash", method = RequestMethod.GET)
	public ModelAndView getProDashboard(calendarVo vo, @RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		ModelAndView modelAndView = new ModelAndView();

		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		System.out.println("project status: " + pro_info.isProject_status());

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
			System.out.println(member_info.get(i).getUser_nickname());
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.viewCalendar(vo);
		modelAndView.addObject("cal", result);
		// 여기까지 달력!!!!!!!!!!!!!!!!!

		// login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		// project 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		// project member 정보 보냄
		modelAndView.addObject("member_info", member_info);
		// pm 정보 보냄
		modelAndView.addObject("pm_info", pm_info);
		modelAndView.setViewName("project/projectDashboard");

		return modelAndView;
	}

	@RequestMapping("/userinfo/postcal")
	public ModelAndView getPostCal(calendarVo vo, @RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		ModelAndView modelAndView = new ModelAndView();

		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		System.out.println("project status: " + pro_info.isProject_status());

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
			System.out.println(member_info.get(i).getUser_nickname());
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.changePostCalendar(vo);
		modelAndView.addObject("cal", result);
		// 여기까지 달력!!!!!!!!!!!!!!!!!

		// login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		// project 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		// project member 정보 보냄
		modelAndView.addObject("member_info", member_info);
		// pm 정보 보냄
		modelAndView.addObject("pm_info", pm_info);
		modelAndView.setViewName("project/projectDashboard");

		return modelAndView;
	}

	@RequestMapping("/userinfo/precal")
	public ModelAndView getPreCal(calendarVo vo, @RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		ModelAndView modelAndView = new ModelAndView();

		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		System.out.println("project status: " + pro_info.isProject_status());

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
			System.out.println(member_info.get(i).getUser_nickname());
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.changePreCalendar(vo);
		modelAndView.addObject("cal", result);
		// 여기까지 달력!!!!!!!!!!!!!!!!!

		// login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		// project 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		// project member 정보 보냄
		modelAndView.addObject("member_info", member_info);
		// pm 정보 보냄
		modelAndView.addObject("pm_info", pm_info);
		modelAndView.setViewName("project/projectDashboard");

		return modelAndView;
	}

}

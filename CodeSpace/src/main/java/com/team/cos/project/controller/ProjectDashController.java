package com.team.cos.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectMemberListGetService;
import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.TDLViewService;
import com.team.cos.project.service.calendarViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.project.vo.TDLVo;
import com.team.cos.project.vo.TodolistVO;
import com.team.cos.project.vo.calendarVo;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
public class ProjectDashController {

	@Autowired
	private calendarViewService service; // 이거 달력임!!!!!!!!!!!!!!!
	@Autowired
	private TDLViewService tdlService;
	@Autowired
	private ProjectRegService proInfoservice;
	@Autowired
	private UserInfoCheckService userInfoService;
	@Autowired
	private ProjectMemberListGetService proMemberService;

//	@RequestMapping("/project/prjdash")
	@RequestMapping(value = "/project/prjdash", method = RequestMethod.GET)
	public ModelAndView getProDashboard(calendarVo vo, @RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) throws CloneNotSupportedException {
		ModelAndView modelAndView = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		// 시작일, 종료일 표출을 위한 처리
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String project_startdate = "";
		String project_enddate = "";

		project_startdate = transFormat.format(pro_info.getProject_startdate());
		project_enddate = transFormat.format(pro_info.getProject_enddate());
		pro_info.setProstring_startdate(project_startdate);
		pro_info.setProstring_enddate(project_enddate);

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.viewCalendar(vo);
		modelAndView.addObject("cal", result);
		List<TodolistVO> list = tdlService.h_getTDL(project_no);
		List<String> start = new ArrayList<>();
		List<String> end = new ArrayList<>();

		TDLVo temp = new TDLVo();
		for (int i = 0; i < list.size(); i++) {
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.setTime(list.get(i).getTodolist_startdate());
			c2.setTime(list.get(i).getTodolist_enddate());
			start.add(sdf.format(c1.getTime()));
			end.add(sdf.format(c2.getTime()));

			temp.setStartDay(start);
			temp.setEndDay(end);
		}

		if (temp.getStartDay() == null || temp.getEndDay() == null) {
			start.add("null");
			end.add("null");

			temp.setStartDay(start);
			temp.setEndDay(end);
		}
		modelAndView.addObject("regged_date", temp);
		// 여기까지 달력관련!!!!!!!!!!!!!!!!!

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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.changePostCalendar(vo);
		modelAndView.addObject("cal", result);
		List<TodolistVO> list = tdlService.h_getTDL(project_no);
		List<String> start = new ArrayList<>();
		List<String> end = new ArrayList<>();

		TDLVo temp = new TDLVo();
		for (int i = 0; i < list.size(); i++) {
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.setTime(list.get(i).getTodolist_startdate());
			c2.setTime(list.get(i).getTodolist_enddate());
			start.add(sdf.format(c1.getTime()));
			end.add(sdf.format(c2.getTime()));

			temp.setStartDay(start);
			temp.setEndDay(end);
		}
		if (temp.getStartDay() == null || temp.getEndDay() == null) {
			start.add("null");
			end.add("null");

			temp.setStartDay(start);
			temp.setEndDay(end);
		}

		modelAndView.addObject("regged_date", temp);
		// 여기까지 달력관련!!!!!!!!!!!!!!!!!

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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		// user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		// project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);

		// project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		// pm의 정보
		UserInfoVo pm_info = userInfoService.userInfoCheckWithNo(pro_info.getPm_no());
		// proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> member_info = new ArrayList<UserInfoVo>();

		for (int i = 0; i < proMember_info.size(); i++) {
			member_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
		}
		// 달력관련임!!!!!!!!!!!!!!!!
		calendarVo result = service.changePreCalendar(vo);
		modelAndView.addObject("cal", result);
		List<TodolistVO> list = tdlService.h_getTDL(project_no);
		List<String> start = new ArrayList<>();
		List<String> end = new ArrayList<>();

		TDLVo temp = new TDLVo();
		for (int i = 0; i < list.size(); i++) {
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.setTime(list.get(i).getTodolist_startdate());
			c2.setTime(list.get(i).getTodolist_enddate());
			start.add(sdf.format(c1.getTime()));
			end.add(sdf.format(c2.getTime()));

			temp.setStartDay(start);
			temp.setEndDay(end);
		}
		if (temp.getStartDay() == null || temp.getEndDay() == null) {
			start.add("null");
			end.add("null");

			temp.setStartDay(start);
			temp.setEndDay(end);
		}

		modelAndView.addObject("regged_date", temp);
		// 여기까지 달력관련!!!!!!!!!!!!!!!!!

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

package com.team.cos.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectMemberListGetService;
import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/prjdash")
public class ProjectDashController {
	
	@Autowired
	private ProjectRegService proInfoservice;
	@Autowired
	private UserInfoCheckService userInfoService;
	@Autowired
	private ProjectMemberListGetService proMemberService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getProDashboard(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no) {
		
		//user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		//project_no에 해당하는 프로젝트 정보 가져옴
		ProjectInfoVO pro_info = proInfoservice.selectProList(project_no);
		//project_no에 해당하는 porject member 정보 가져옴
		List<ProjectMemberVO> proMember_info = proMemberService.getMember(project_no);
		//proMember_info에서 가져온 member_no를 가지고 List<UserInfoVo>에 저장
		List<UserInfoVo> memberDetail_info = new ArrayList<UserInfoVo>();
		List<String> member_nickname = new ArrayList<String>();
 		for(int i=0; i<proMember_info.size(); i++) {
			System.out.println(proMember_info.get(i).getMember_no());
			memberDetail_info.add(userInfoService.userInfoCheckWithNo(proMember_info.get(i).getMember_no()));
			System.out.println(memberDetail_info.get(i).getUser_nickname());
			member_nickname.add(memberDetail_info.get(i).getUser_nickname());
			
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		//login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);
		//project 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		//project member 정보 보냄
		modelAndView.addObject("member_nickname", member_nickname);
		modelAndView.setViewName("project/projectDashboard");
	
		return modelAndView;
	}

}

package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.InvitationMailService;
import com.team.cos.project.service.ProjectMemberInvitationService;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/inviteMember")
public class ProjectMemberInviteController {
	
	@Autowired
	UserInfoCheckService userInfoService;
	@Autowired
	InvitationMailService mailService;
	@Autowired
	ProjectMemberInvitationService memberInvitationService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView projectMemberInvite(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no,
			@RequestParam(value="member") List<Integer> member
			) {

		System.out.println("member size: "+member.size());
		
		// member에 해당하는 userInto 객체 생성 및 메일 보내기
		UserInfoVo projectMemberInfo; 
		for(int i=0; i<member.size(); i++) {
			projectMemberInfo = userInfoService.userInfoCheckWithNo(member.get(i));
			System.out.println("memberInfo: "+projectMemberInfo);
			mailService.sendMail(project_no, projectMemberInfo);
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("redirect:prjdash");
		
		return modelAndView;
	}
}

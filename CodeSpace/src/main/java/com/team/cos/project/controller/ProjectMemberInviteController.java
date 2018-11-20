package com.team.cos.project.controller;

import java.util.List;

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
	
	UserInfoCheckService userInfoService;
	InvitationMailService mailService;
	ProjectMemberInvitationService memberInvitationService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView invite(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no,
			@RequestParam(value="member") List<Integer> member
			) {
		
		int user_no1 = member.get(0);
		int user_no2 = member.get(1);
		int user_no3 = member.get(2);
		int user_no4 = member.get(3);
		
		System.out.println("project_no: "+project_no+"// user_no: "+user_no+"// member: "+user_no2);
		
		//member list를 가지고 사용자 email을 확인하여 메일 전송 > 초대 전송 완료 후 
		//project_no와 user_no를 가지고 project dashboard로 이동
		UserInfoVo memberInfo1 = userInfoService.userInfoCheckWithNo(user_no1) ;
		UserInfoVo memberInfo2 = userInfoService.userInfoCheckWithNo(user_no2) ;
		UserInfoVo memberInfo3 = userInfoService.userInfoCheckWithNo(user_no3) ;
		UserInfoVo memberInfo4 = userInfoService.userInfoCheckWithNo(user_no4) ;
		
		mailService.sendMail(memberInfo1);
		mailService.sendMail(memberInfo2);
		mailService.sendMail(memberInfo3);
		mailService.sendMail(memberInfo4);
		

		//project db에 저장
		memberInvitationService.invite(member, project_no);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		modelAndView.setViewName("redirect:prjdash");
		
		return modelAndView;
	}
}

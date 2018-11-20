package com.team.cos.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.MemberInvitationService;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/inviteMember")
public class ProjectMemberInviteController {
	
	UserInfoCheckService userInfoService;
	MemberInvitationService memberInviteService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView invite(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no,
			@RequestParam(value="member") List<Integer> member
			) {
		
		System.out.println("project_no: "+project_no+"// user_no: "+user_no+"// member"+member.get(0));
		
		//member list를 가지고 사용자 email을 확인하여 메일 전송 > 초대 전송 완료 후 
		//project_no와 user_no를 가지고 project dashboard로 이동
		UserInfoVo memberInfo ;
		
		for(int i=0; i<member.size(); i++) {
			//member에 들어있는 user_no를 가지고 사용자 정보 추출
			memberInfo = userInfoService.userInfoCheckWithNo(member.get(i));
			//mail 보내기
			memberInviteService.sendMail(memberInfo);
			//project db에 저장
			
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("project_no", project_no);
		modelAndView.addObject("user_no", user_no);
		
		
		
		return modelAndView;
	}

}

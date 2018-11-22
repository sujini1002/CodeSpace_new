package com.team.cos.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.project.service.ProjectMemberInvitationService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/projectMemberAccept")
public class ProjectMemberAcceptController {
	
	@Autowired
	ProjectMemberInvitationService invitationService;

	@RequestMapping(method=RequestMethod.GET)
	public String accept(
			@RequestParam("project_no") int project_no,
			@RequestParam("project_member_no") int member_no,
			HttpSession session) {
		
		if(session != null) {
			UserInfoVo loginUserInfo = (UserInfoVo) session.getAttribute("loginInfo");
			
			//아마 트랜잭션 해야될거에욤
			if(loginUserInfo.getUser_no() == member_no) {
				//로그인한 사용자와 전달받은 project_member_no 값이 같으면
				//db에저장!하고 project dashboard에추가
				int result = invitationService.acceptMember(project_no, member_no);
				
				System.out.println("멤버등록완료: "+result);
				return "project/memberAccept";
			} else {
				return "project/memberAcceptFail";
			}
		} else {
			return "redirect:/";
		}
		
	}
}

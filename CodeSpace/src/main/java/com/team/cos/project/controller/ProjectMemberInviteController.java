package com.team.cos.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/project/inviteMember")
public class ProjectMemberInviteController {
	
	@RequestMapping(method = RequestMethod.POST)
	public String invite(
			@RequestParam("project_no") int project_no,
			@RequestParam("user_no") int user_no,
			@RequestParam(value="member") List<Integer> member
			) {
		
		System.out.println("project_no: "+project_no+"// user_no: "+user_no+"// member"+member);
		
		
		
		
		
		
		
		
		
		return "project/successInvite";
	}

}

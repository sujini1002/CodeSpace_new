package com.team.cos.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/project/inviteMember")
public class ProjectMemberInviteController {
	
	@RequestMapping(method = RequestMethod.POST)
	public String invite() {
		
		
		return "project/successInvite";
	}

}

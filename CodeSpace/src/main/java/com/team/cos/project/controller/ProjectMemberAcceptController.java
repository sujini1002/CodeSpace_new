package com.team.cos.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/projectMemberAccept")
public class ProjectMemberAcceptController {

	@RequestMapping(method=RequestMethod.GET)
	public String accept(
			@RequestParam("project_member_no") int project_member_no,
			HttpSession session) {
		
		if(session != null) {
			UserInfoVo loginUserInfo = (UserInfoVo) session.getAttribute("loginInfo");
			
			//로그인한 사용자와 전달받은 project_member_no 값이 같으면
			//
			if(loginUserInfo.getUser_no() == project_member_no) {
				return "redirect:/project/prjdash";
			}
		} else {
			return "redirect:/";
		}
		
		return "redirect:/";
	}
}

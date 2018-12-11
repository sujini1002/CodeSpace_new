package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.search.service.UserSearchService;
import com.team.cos.userinfo.vo.UserInfoVo;

@RestController
public class ProUserSearchController {
	
	@Autowired
	UserSearchService service;
	
	@ResponseBody
	@RequestMapping(value="project/userSearch", method = RequestMethod.POST)
	public List<UserInfoVo> proUserList(
			@RequestParam("user_nickname") String user_nickname) {
		// user_nickname에 해당하는 userInfoVo 가져옴
		List<UserInfoVo> searchUserInfo = service.getSearchUsers(user_nickname);

		return searchUserInfo; 
	}
	
	@ResponseBody
	@RequestMapping(value="project/userSearchExceptSelectedMember", method = RequestMethod.POST)
	public List<UserInfoVo> proUserListExceptSelectedMember(
			@RequestParam("user_nickname") String user_nickname,
			@RequestParam("member") List<Integer> member) {
		// user_nickname에 해당하고, member에 해당하지 않는 userInfoVo 가져옴
		ProjectMemberVO projectMemberInfo = new ProjectMemberVO();
		projectMemberInfo.setUser_nickname(user_nickname);
		projectMemberInfo.setMember(member);
		
		List<UserInfoVo> searchUserInfo = service.getSearchUsers(projectMemberInfo);
		
		return searchUserInfo; 
	}
	
	

}

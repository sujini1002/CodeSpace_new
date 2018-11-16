package com.team.cos.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.search.service.UserSearchService;
import com.team.cos.userinfo.vo.UserInfoVo;

@RestController
@RequestMapping("project/proUserSearch")
public class ProUserSearchController {
	
	@Autowired
	UserSearchService service;
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public List<UserInfoVo> proUserList(
			@RequestParam("user_nickname") String user_nickname,
			HttpServletResponse response ) {
		
		// user_nickname에 해당하는 userInfoVo 가져옴
		List<UserInfoVo> searchUserInfo = service.getSearchUsers(user_nickname);

		
		
		
		return searchUserInfo; 
		
	}
	
	

}

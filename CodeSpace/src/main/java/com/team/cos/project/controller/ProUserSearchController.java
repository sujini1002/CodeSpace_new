package com.team.cos.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.cos.search.service.UserSearchService;

@RestController
@RequestMapping("project/proUserSearch")
public class ProUserSearchController {
	
	@Autowired
	UserSearchService service;
	
	@RequestMapping(method = RequestMethod.POST)
	public void proUserList(
			@RequestParam("user_nickname") String user_nickname,
			HttpServletResponse response ) {
		
		List searchUserInfo = service.getSearchUsers(user_nickname);
		ObjectMapper mapper = new ObjectMapper();
		try {
		// string 으로 저장
			//String jsonString = mapper.writeValueAsString(list);
			response.getWriter().print(mapper.writeValueAsString(searchUserInfo));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	

}

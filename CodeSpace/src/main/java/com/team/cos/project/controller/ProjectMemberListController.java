package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.service.ProjectMemberListGetService;
import com.team.cos.project.vo.ProjectMemberVO;

@RestController
@RequestMapping("project/projectMember")
public class ProjectMemberListController {
	
	@Autowired
	ProjectMemberListGetService service ;
	
	@RequestMapping("/{project_no}")
	public ResponseEntity<List<ProjectMemberVO>> getMemberList(@PathVariable("project_no") int project_no ){
		
		List<ProjectMemberVO> memberList = service.getMember(project_no);
		System.out.println("project_no: "+project_no+" memberList: "+memberList);
		
		return new ResponseEntity<>(memberList, HttpStatus.OK);
	}

}

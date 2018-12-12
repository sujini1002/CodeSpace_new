package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.service.ProjectRevisionService;
import com.team.cos.project.vo.ProjectInfoVO;

@RestController
public class ProjectRevisionListViewController {
	
	@Autowired
	private ProjectRevisionService revisionService;
	
	//project_no에 해당하는 여러개의 revision history 가져오기
	@RequestMapping("project/revisionList/{project_no}")
	public ResponseEntity<List<ProjectInfoVO>> getList(
			@PathVariable("project_no") int project_no){

		List<ProjectInfoVO> revisionHistory = revisionService.getRevisionList(project_no);
			
		return new ResponseEntity<>(revisionHistory, HttpStatus.OK);
	}
	


}

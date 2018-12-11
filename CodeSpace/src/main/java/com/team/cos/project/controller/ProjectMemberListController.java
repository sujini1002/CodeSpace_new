package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.service.ProjectMemberListGetService;
import com.team.cos.project.service.UserProjectViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@RestController
@RequestMapping("project/projectMember")
public class ProjectMemberListController {
	
	@Autowired
	ProjectMemberListGetService service ;
	@Autowired
	UserInfoCheckService userService;
	@Autowired
	UserProjectViewService projectInfoService;
	
	@RequestMapping("/{project_no}")
	public ResponseEntity<List<ProjectMemberVO>> getMemberList(@PathVariable("project_no") int project_no ){
		//프로젝트 정보 가져와서 pm_no도 추가하기
		ProjectInfoVO projectInfo = projectInfoService.getUserAllProject(project_no);
		ProjectMemberVO pmInfo = new ProjectMemberVO();
		pmInfo.setMember_no(projectInfo.getPm_no());
		List<ProjectMemberVO> memberList = service.getMember(project_no);
		memberList.add(pmInfo);
		
		//list.get(i)에 해당하는.. nickname 저장해야됨
		UserInfoVo user = new UserInfoVo();
		for(int i=0; i<memberList.size(); i++) {
			user = userService.userInfoCheckWithNo(memberList.get(i).getMember_no());
			memberList.get(i).setUser_nickname(user.getUser_nickname());
		}
		
		return new ResponseEntity<>(memberList, HttpStatus.OK);
	}

}

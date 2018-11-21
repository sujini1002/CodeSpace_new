package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;

public class ProjectMemberInvitationService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	public int invite(List<Integer> member, int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		System.out.println("Project Member Invitation Service: "+ member + "// project_no: "+project_no);
		
		return dao.memberUpdate(member, project_no);
	}

}

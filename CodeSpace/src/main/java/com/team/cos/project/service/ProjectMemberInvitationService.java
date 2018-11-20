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
		
		int user_no1 = member.get(0);
		int user_no2 = member.get(1);
		int user_no3 = member.get(2);
		int user_no4 = member.get(3);
		
		return dao.memberUpdate(user_no1, user_no2, user_no3, user_no4, project_no);
	}

}

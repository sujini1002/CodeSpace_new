package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectMemberVO;

public class ProjectMemberInvitationService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	public int acceptMember(int project_no, int project_member_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		ProjectMemberVO vo = new ProjectMemberVO();
		vo.setProject_no(project_no);
		vo.setMember_no(project_member_no);
		
		return dao.memberUpdate(vo);
	}

}

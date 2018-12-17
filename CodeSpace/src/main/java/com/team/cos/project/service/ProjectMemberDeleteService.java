package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.project.dao.ProjectInfoInterface;

@Transactional(readOnly=true)
public class ProjectMemberDeleteService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private ProjectInfoInterface dao;
	
	@Transactional
	public int deleteMember(int member_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.memberDelete(member_no);
	}

}

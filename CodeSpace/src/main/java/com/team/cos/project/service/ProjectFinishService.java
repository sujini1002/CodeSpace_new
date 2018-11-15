package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;

public class ProjectFinishService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	public int proStatus(int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		System.out.println("Project Finish Service project_no: "+project_no);
		return dao.updateProStatus(project_no);
	}
}

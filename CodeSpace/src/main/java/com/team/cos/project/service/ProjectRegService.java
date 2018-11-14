package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.TodolistVO;

public class ProjectRegService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	//project regster (insert)
	public int regProject(ProjectInfoVO vo) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.insertProject(vo);
	}
	
	//project select
	public ProjectInfoVO selectProList(int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		ProjectInfoVO list = dao.selectProjectList(project_no);
		return list;
	}
	


	

}



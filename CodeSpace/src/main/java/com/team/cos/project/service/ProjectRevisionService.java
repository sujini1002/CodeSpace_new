package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;

public class ProjectRevisionService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	// 프로젝트 정보 수정과 동시에 Revision table에 입력함
	public void insertRevisionProject(int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		dao.insertRevisionProject(project_no);
	}
		
	// revision history get
	public List<ProjectInfoVO> getRevisionList(int project_no){
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		List<ProjectInfoVO> projectRevisionInfo = dao.getRevisionList(project_no);
		return projectRevisionInfo;
	}

}

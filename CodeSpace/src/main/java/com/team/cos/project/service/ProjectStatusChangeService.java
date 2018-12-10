package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;

public class ProjectStatusChangeService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	//project status 를 finish (false, 0)으로 변경
	public int changeToFinish(int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		System.out.println("Project Finish Service project_no: "+project_no);
		return dao.updateProStatus(project_no);
	}
	
	
	//project status를 restart (true, 1)로 변경
	public int changeToStart(ProjectInfoVO vo) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);

		
		return dao.updateProStatusToStart(vo);
	}
	
	
	
}

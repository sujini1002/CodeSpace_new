package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;

public class UserProjectViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	// 로그인한 사용자가 참여중인 프로젝트의 정보 반환(현재 진행중)
	public List<ProjectInfoVO> getUserPro(int user_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.selectUserPro(user_no);
	}
	
	// 로그인한 사용자의 모든 프로젝트 정보 반환
	public ProjectInfoVO getUserAllProject(int project_no){
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.selectAllProjectList(project_no);
	}
	
	
	
	// 로그인한 사용자가 pm인 경우 참여중인 프로젝트의 정보 반환
	public List<ProjectInfoVO> getPmPro(int pm_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.selectPmProject(pm_no);
	}
	
	public List getProject_no(int user_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		return dao.selectProjectNo(user_no);
	}

}

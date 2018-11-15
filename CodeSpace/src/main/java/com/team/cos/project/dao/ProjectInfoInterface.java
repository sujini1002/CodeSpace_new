package com.team.cos.project.dao;

import com.team.cos.project.vo.ProjectInfoVO;

public interface ProjectInfoInterface {
	
	//project_no와 일치하는 프로젝트 정보를 보여주는 메서드
	public ProjectInfoVO selectProjectList(int project_no);
	
	//project insert
	public int insertProject(ProjectInfoVO vo);
	
	//프로젝트 정보 업데이트
	public int updateProject(ProjectInfoVO vo);
	
	//로그인한 사용자가 참여중인 project 정보를 보여주는 메서드
	public ProjectInfoVO selectUserPro(int user_no);

}

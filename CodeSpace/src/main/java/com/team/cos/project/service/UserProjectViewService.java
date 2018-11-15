package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;

public class UserProjectViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	// 로그인한 사용자가 참여중인 프로젝트의 정보 반환
	public ProjectInfoVO getUserPro(int user_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		return dao.selectUserPro(user_no);
	}

}

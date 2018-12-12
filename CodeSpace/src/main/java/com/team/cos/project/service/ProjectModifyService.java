package com.team.cos.project.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;


public class ProjectModifyService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	
	public int modifyProInfo(ProjectInfoVO vo) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		int updateCnt = dao.updateProject(vo);
		System.out.println("project info update: "+updateCnt);
		
		return updateCnt;
	}
	

}

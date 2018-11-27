package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.userinfo.vo.UserInfoVo;

public class ProjectMemberListGetService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	
	public List<ProjectMemberVO> getMember(int project_no) {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		//member의 고유 번호만 가져옴
		List<ProjectMemberVO> list = dao.selectMember(project_no);
		
		
		return list;
	}

}

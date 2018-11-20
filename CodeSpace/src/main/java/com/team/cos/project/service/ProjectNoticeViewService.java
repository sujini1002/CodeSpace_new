package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectNoticeVO;

@Service
public class ProjectNoticeViewService {

	@Autowired
	private SqlSessionTemplate template;

	private ProjectInfoInterface dao;

	public List<ProjectNoticeVO> noticeView(ProjectInfoVO projectInfoVo) {
		dao = template.getMapper(ProjectInfoInterface.class);

		List<ProjectNoticeVO> result = dao.projectNoticeView(projectInfoVo);
		
		return result;
	}

}

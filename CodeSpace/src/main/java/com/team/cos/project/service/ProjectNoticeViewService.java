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

//	공지사항 목록 출력
	public List<ProjectNoticeVO> noticeView(ProjectInfoVO projectInfoVo) {
		dao = template.getMapper(ProjectInfoInterface.class);
		List<ProjectNoticeVO> result = dao.projectNoticeView(projectInfoVo);
		return result;
	}

//	공지사항 세부 출력
	public ProjectNoticeVO noticeDetailView(ProjectNoticeVO projectNoticeVO) {
		ProjectNoticeVO result = new ProjectNoticeVO();
		dao = template.getMapper(ProjectInfoInterface.class);
		result = dao.noticeDetailView(projectNoticeVO);
		System.out.println(result);
		return result;
	}

}

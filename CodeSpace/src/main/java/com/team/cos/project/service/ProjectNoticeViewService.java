package com.team.cos.project.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.project.dao.ProjectInfoInterface;
import com.team.cos.project.vo.PageNum;
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

	public List<ProjectNoticeVO> noticeView2(ProjectInfoVO projectInfoVo, PageNum pageNum) {
		ProjectInfoVO param = new ProjectInfoVO();
		int firstRow = pageNum.getFirstRow();
		int endRow = pageNum.getEndRow();

		param.setFirstRow(firstRow);
		param.setEndRow(endRow);
		projectInfoVo.setFirstRow(firstRow);
		projectInfoVo.setEndRow(endRow);

		dao = template.getMapper(ProjectInfoInterface.class);
		System.out.println("projectInfoVo::::" + projectInfoVo);
		List<ProjectNoticeVO> result = dao.projectNoticeView2(projectInfoVo);
		System.out.println("result@@@@@" + result);
		return result;
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 5;

	public PageNum noticePageCheck(ProjectInfoVO projectInfoVo, PageNum pageNum) {
		dao = template.getMapper(ProjectInfoInterface.class);
		List<ProjectNoticeVO> noticeList = new ArrayList<ProjectNoticeVO>();
		PageNum result = new PageNum();
		int currentPage = pageNum.getPageNum();
		int pageTotalCont = dao.noticePageCheck(projectInfoVo).getPageTotalCont();
		// 전체 메세지 개수 구하기
		result.setPageTotalCont(pageTotalCont);
		if (result.getPageTotalCont() > 0) {
			int firstRow = (pageNum.getPageNum() - 1) * MESSAGE_COUNT_PER_PAGE;
			int endRow = MESSAGE_COUNT_PER_PAGE;
			result.setFirstRow(firstRow);
			result.setEndRow(endRow);
			result.setMessageCountPerPage(MESSAGE_COUNT_PER_PAGE);
			noticeList = noticeView2(projectInfoVo, result);
			result.setNoticeList(noticeList);
			result.cal();
			result.setPageNum(pageNum.getPageNum());
		} else {
			currentPage = 0;
			noticeList = Collections.emptyList();
		}

		System.out.println("@@@@@@@@" + result);
		return result;
	}

	/*
	 * public List<ProjectNoticeVO> noticeView(ProjectInfoVO projectInfoVo) {
	 * pagingDao = template.getMapper(PagingDaoInterface.class);
	 * List<ProjectNoticeVO> result = pagingDao.projectNoticeView(projectInfoVo);
	 * return result; }
	 */

//	공지사항 세부 출력
	public ProjectNoticeVO noticeDetailView(ProjectNoticeVO projectNoticeVO) {
		ProjectNoticeVO result = new ProjectNoticeVO();
		dao = template.getMapper(ProjectInfoInterface.class);
		result = dao.noticeDetailView(projectNoticeVO);
		return result;
	}

//	공지사항 삭제
	public int noticeDelete(ProjectNoticeVO projectNoticeVO) {
		dao = template.getMapper(ProjectInfoInterface.class);
		int result = dao.noticeDelete(projectNoticeVO);
		return result;
	}

//	pm인지 확인
	public ProjectInfoVO checkPm(ProjectInfoVO projectInfoVO) {
		ProjectInfoVO result = new ProjectInfoVO();
		dao = template.getMapper(ProjectInfoInterface.class);
		result = dao.checkPm(projectInfoVO);
		return result;
	}

//	공지사항 작성
	public int noticeWrite(ProjectNoticeVO projectNoticeVO) {
		dao = template.getMapper(ProjectInfoInterface.class);
		int result = dao.noticeWrite(projectNoticeVO);
		System.out.println(result);
		return result;

	}

	public void noticeUpdate(ProjectNoticeVO projectNoticeVO) {
		dao = template.getMapper(ProjectInfoInterface.class);
		dao.noticeUpdate(projectNoticeVO);
	}

}

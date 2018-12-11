package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.paging.service.PagingService;
import com.team.cos.project.service.ProjectNoticeViewService;
import com.team.cos.project.vo.PageNum;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectNoticeVO;

//user_no/project_no/공지사항은 project 테이블에 pm_no에해당하는 사용자만 작성가능
@Controller
public class ProjectNoticeController {
	@Autowired
	private ProjectNoticeViewService service;
	@Autowired
	private PagingService pagingService;

	@RequestMapping(value = "/project/notice")
	@ResponseBody
	public List<ProjectNoticeVO> useAjax(ProjectInfoVO projectInfoVo) {
		List<ProjectNoticeVO> result = service.noticeView(projectInfoVo);
		return result;
	}

//	공지사항 목록 출력
	@RequestMapping(value = "/project/notice/notice", method = RequestMethod.GET)
	public ModelAndView getNotice(ProjectInfoVO projectInfoVo, PageNum pageNum) {

		ModelAndView modelAndView = new ModelAndView();
		PageNum result = new PageNum();

		if (pageNum.getPageNum() > 1) {
			result.setPageNum(pageNum.getPageNum());
			pageNum.setPageNum(result.getPageNum());
		} else {
			pageNum.setPageNum(1);
		}

		result = service.noticePageCheck(projectInfoVo, pageNum);
//		List<ProjectNoticeVO> result = service.noticeView(projectInfoVo);
		modelAndView.setViewName("project/notice/notice");
		modelAndView.addObject("projectNotice", result);

		modelAndView.addObject("project_no", projectInfoVo.getProject_no());
		return modelAndView;
	}

//	공지사항 상세보기
	@RequestMapping(value = "/project/notice/detailnotice", method = RequestMethod.GET)
	public ModelAndView getDetailNotice(ProjectNoticeVO projectNoticeVO) {
		ModelAndView modelAndView = new ModelAndView();
		ProjectNoticeVO result = service.noticeDetailView(projectNoticeVO);
		modelAndView.setViewName("project/notice/detailnotice");
		modelAndView.addObject("projectNotice", result);
		return modelAndView;
	}

	// 공지사항 작성권한 체크
	@RequestMapping(value = "/project/notice/check", method = RequestMethod.GET)
	@ResponseBody
	public ProjectInfoVO writeNotice(ProjectInfoVO projectInfoVo) {
		ProjectInfoVO result = service.checkPm(projectInfoVo);
		return result;
	}

//	공지사항 페이지 이동
	@RequestMapping(value = "/project/notice/write", method = RequestMethod.GET)
	public ModelAndView getWriteNotice(ProjectNoticeVO projectNoticeVO) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("project/notice/write");
		modelAndView.addObject("project_no", projectNoticeVO.getProject_no());
		return modelAndView;
	}

//	공지사항 작성 입력
	@RequestMapping(value = "/project/notice/write", method = RequestMethod.POST)
	public void postWriteNotice(ProjectNoticeVO projectNoticeVO) {
		service.noticeWrite(projectNoticeVO);
	}

//	공지사항 수정
	@RequestMapping(value = "/project/notice/modify", method = RequestMethod.GET)
	public ModelAndView modifyNotice(ProjectNoticeVO projectNoticeVO) {
		ModelAndView modelAndView = new ModelAndView();
		ProjectNoticeVO result = service.noticeDetailView(projectNoticeVO);
		modelAndView.setViewName("project/notice/modify");
		modelAndView.addObject("projectNotice", result);
		return modelAndView;
	}

//	공지사항 수정사항 저장
	@RequestMapping(value = "/project/notice/modify", method = RequestMethod.POST)
	public void saveModifyNotice(ProjectNoticeVO projectNoticeVO) {
		service.noticeUpdate(projectNoticeVO);
	}

//	공지사항 삭제
	@RequestMapping(value = "/project/notice/delete", method = RequestMethod.GET)
	public ModelAndView deleteNotice(ProjectNoticeVO projectNoticeVO) {
		ProjectInfoVO projectInfoVo = new ProjectInfoVO();
		ModelAndView modelAndView = new ModelAndView();
		int result = service.noticeDelete(projectNoticeVO);

		projectInfoVo.setProject_no(projectNoticeVO.getProject_no());
		List<ProjectNoticeVO> resultList = service.noticeView(projectInfoVo);

		if (result > 0) {
			modelAndView.setViewName("redirect:/project/notice/notice?project_no=" + projectNoticeVO.getProject_no());
			modelAndView.addObject("projectNotice", resultList);
		}
		return modelAndView;
	}
}
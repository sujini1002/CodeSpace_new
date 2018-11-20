package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.project.service.ProjectNoticeViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectNoticeVO;

//user_no/project_no/공지사항은 project 테이블에 pm_no에해당하는 사용자만 작성가능
@Controller
public class ProjectNoticeController {
	@Autowired
	private ProjectNoticeViewService service;
	
	
	@RequestMapping(value = "/project/notice")
	@ResponseBody
	public List<ProjectNoticeVO> useAjax(ProjectInfoVO projectInfoVo) {
		List<ProjectNoticeVO> result = service.noticeView(projectInfoVo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("projectNotice", result);
		return result;
	}

	@RequestMapping(value = "/project/notice/notice", method = RequestMethod.GET)
	public String getNotice(ProjectInfoVO projectInfoVo) {
		return "project/notice/notice";
	}

	@RequestMapping(value = "/project/notice/notice", method = RequestMethod.POST)
	public String postNotice() {
		return null;
	}

	@RequestMapping(value = "/project/notice/notice", method = RequestMethod.PUT)
	public String modifyNotice() {
		return null;
	}

	@RequestMapping(value = "/project/notice/notice", method = RequestMethod.DELETE)
	public String deleteNotice() {
		return null;
	}
}
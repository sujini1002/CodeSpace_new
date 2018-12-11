package com.team.cos.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.paging.service.PagingService;
import com.team.cos.paging.vo.PageMaker;
import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.project.service.ProjectRegService;
import com.team.cos.project.service.UserProjectViewService;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.userinfo.service.UserInfoCheckService;
import com.team.cos.userinfo.vo.UserInfoVo;

@Controller
@RequestMapping("/project/prjreg")
public class ProjectRegController {

	@Autowired
	private ProjectRegService service;
	@Autowired
	private UserProjectViewService userProInfoService;
	@Autowired
	private UserInfoCheckService userInfoService;
	// 페이징
	@Autowired
	private PagingService pagingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView projectRegForm(
			@RequestParam("user_no") int user_no,
			@ModelAttribute("cri") SearchCriteria cri) {
		
		//user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		
		//페이징 처리된 project 정보 list 형태로 가져옴
		List<ProjectInfoVO> userJoinProjects = pagingService.projectListCriteria(cri);
		
		// 시작일, 종료일 표출을 위한 처리
		if(userJoinProjects!=null) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String start="";
			String end="";
			
			for(int i=0; i<userJoinProjects.size(); i++) {
				
				start = transFormat.format(userJoinProjects.get(i).getProject_startdate());
				end = transFormat.format(userJoinProjects.get(i).getProject_enddate());
				userJoinProjects.get(i).setProstring_startdate(start);
				userJoinProjects.get(i).setProstring_enddate(end);
				
			}
		} 
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearchCri(cri);
		
		pageMaker.setTotalCount(pagingService.projectListCountCriteria(cri));
		

		
		
		
		ModelAndView modelAndView = new ModelAndView();
		// 로그인한 사용자가 참여중인 프로젝트 리스트 모두 전달
		// 페이징처리
		modelAndView.addObject("userJoinProjects", userJoinProjects);
		modelAndView.addObject("user_info", user_info);
		modelAndView.addObject("pageMaker", pageMaker);
		
		modelAndView.setViewName("project/projectReg");

		return modelAndView;
	}
	
	
	// 프로젝트 생성 폼 입력 후 전달+db 입력하는 것임
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView projectReg(ProjectInfoVO vo,
			@RequestParam("user_no") int user_no) throws ParseException {

		// 입력폼으로부터 전달받은 vo 객체 중, 종료일자 포맷 변경을 위한 처리
		String enddate = vo.getProstring_enddate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(enddate);
		
		vo.setProject_enddate(to);
		// 전달받은 vo 객체를 project DB 저장: 프로젝트 정보 insert
		int regCnt = service.regProject(vo);
		System.out.println("프로젝트 등록 완료 개수: "+regCnt);
		
	

		ModelAndView modelAndView = new ModelAndView();		
		//projectDashController로 project_no, user_no 값 보냄 
		modelAndView.addObject("project_no", vo.getProject_no());
		modelAndView.addObject("user_no", user_no);		
		//redirect는 controller를 타게 하는 것 !
		modelAndView.setViewName("redirect:prjdash");
		return modelAndView;
	}

}

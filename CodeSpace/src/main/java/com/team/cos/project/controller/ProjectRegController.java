package com.team.cos.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	private UserProjectViewService userProInfoservice;
	@Autowired
	private UserInfoCheckService userInfoService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView projectRegForm(@RequestParam("user_no") int user_no) {
		
		System.out.println("project reg controller!");
		
		//user_no가 포함된 userInfoVO 가져옴
		UserInfoVo user_info = userInfoService.userInfoCheckWithNo(user_no);
		System.out.println("PRG userInfo.user_id = "+user_info.getUser_id());
		
		//로그인한 사용자가 참여중인 projectInfoVO 가져옴
		ProjectInfoVO userpro_info = userProInfoservice.getUserPro(user_no);
		System.out.println("userpro info: "+userpro_info);
		
		// 86번에 해당하는 프로젝트 표출 >> to do list 표출 확인 테스트용
		ProjectInfoVO pro_info = service.selectProList(86);

		ModelAndView modelAndView = new ModelAndView();
		
		// user_score가 31 미만인 사용자는 projectRegFail.jsp로 보냄
		System.out.println("user score: "+user_info.getUser_score());
		if(user_info.getUser_score()<31) {
			modelAndView.setViewName("project/projectRegFail");
		} else {
			if(userpro_info!=null) {
				modelAndView.addObject("userpro_info", pro_info);
				modelAndView.setViewName("project/projectDashboard");
			} else {
				modelAndView.setViewName("project/projectReg");
			}
		}
		
		//프로젝트 정보 보냄
		modelAndView.addObject("pro_info", pro_info);
		//login 사용자 정보 보냄
		modelAndView.addObject("user_info", user_info);

		return modelAndView;
	}
	
	
	// 프로젝트 생성 폼 입력 후 전달+db 입력하는 것임
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView projectReg(ProjectInfoVO vo,
			@RequestParam("user_no") int user_no,
			@RequestParam("pm_no") int pm_no) throws ParseException {

		// 입력폼으로부터 전달받은 vo 객체 중, 종료일자 포맷 변경을 위한 처리
		System.out.println("project reg post: "+vo.getProstring_enddate());
		String enddate = vo.getProstring_enddate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(enddate);
		
		vo.setProject_enddate(to);
		// 전달받은 vo 객체를 db 저장: 프로젝트 정보 insert
		int regCnt = service.regProject(vo);
		System.out.println("register!!: " + regCnt);


		ModelAndView modelAndView = new ModelAndView();		
		//projectDashController로 project_no, user_no 값 보냄 
		modelAndView.addObject("project_no", vo.getProject_no());
		modelAndView.addObject("user_no", user_no);		
		//redirect는 controller를 타게 하는 것 !
		modelAndView.setViewName("redirect:prjdash");
		return modelAndView;
	}

}

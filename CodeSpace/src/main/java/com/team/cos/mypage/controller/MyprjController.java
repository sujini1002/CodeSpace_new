package com.team.cos.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.mypage.service.MyprjService;
import com.team.cos.project.vo.ProjectInfoVO;

@Controller
@RequestMapping("/mypage/myPrj")
public class MyprjController {
	
	@Autowired
	private MyprjService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMyprj(@RequestParam("user_no") int user_no) {
		
		List<ProjectInfoVO> myPrjList = service.getMyprj(user_no);
		
		if(myPrjList!=null) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String start="";
			String end="";
			
			for(int i=0; i<myPrjList.size(); i++) {
				
				start = transFormat.format(myPrjList.get(i).getProject_startdate());
				end = transFormat.format(myPrjList.get(i).getProject_enddate());
				myPrjList.get(i).setProstring_startdate(start);
				myPrjList.get(i).setProstring_enddate(end);
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("myPrjList", myPrjList);
		modelAndView.setViewName("mypage/myPrj");
		
		return modelAndView;
	}

}

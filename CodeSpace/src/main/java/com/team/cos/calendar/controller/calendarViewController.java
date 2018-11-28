/*package com.team.cos.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cos.calendar.Vo.calendarVo;
import com.team.cos.calendar.service.calendarViewService;

@Controller
public class calendarViewController {
	@Autowired
	private calendarViewService service;

	@RequestMapping("/userinfo/hjscal")
	public ModelAndView viewCalendar(calendarVo vo) {
		System.out.println("viewCalendar진입");
		ModelAndView modelAndView = new ModelAndView();
		calendarVo result = service.viewCalendar(vo);
		modelAndView.setViewName("userinfo/hjscal");
		modelAndView.addObject("cal", result);
		System.out.println(result.getArrayDay());
		return modelAndView;
	}
	@RequestMapping("/userinfo/postcal")
	public ModelAndView changePostCalendar(calendarVo vo) {
		ModelAndView modelAndView = new ModelAndView();
		calendarVo result = service.changePostCalendar(vo);
		modelAndView.setViewName("userinfo/hjscal");
		modelAndView.addObject("cal", result);
		return modelAndView;
	}
	@RequestMapping("/userinfo/precal")
	public ModelAndView changePreCalendar(calendarVo vo) {
		ModelAndView modelAndView = new ModelAndView();
		calendarVo result = service.changePreCalendar(vo);
		modelAndView.setViewName("userinfo/hjscal");
		modelAndView.addObject("cal", result);
		return modelAndView;
	}
}
*/
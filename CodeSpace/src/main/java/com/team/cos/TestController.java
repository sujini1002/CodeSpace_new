package com.team.cos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/project")
	public String test() {
		return "project/projectMain";
	}
	@RequestMapping("/userinfo/test")
	public String test2() {
		return "userinfo/test";
	}
}	

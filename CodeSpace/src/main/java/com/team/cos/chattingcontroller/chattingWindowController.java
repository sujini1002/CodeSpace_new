package com.team.cos.chattingcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chattingWindowController {

	@RequestMapping("/chattingWindow")
	public String chattingWindow() {
		return "chattingWindow";
	}
}

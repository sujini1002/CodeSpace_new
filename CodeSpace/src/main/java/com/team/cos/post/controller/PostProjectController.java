package com.team.cos.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/post/postPrj")
public class PostProjectController {

	@RequestMapping(method = RequestMethod.GET)
	public String getPostPrj() {

		return "post/postPrj";
	}
}
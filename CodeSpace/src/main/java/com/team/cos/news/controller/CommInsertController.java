package com.team.cos.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.cos.news.service.CommInsertService;

@Controller
@RequestMapping("/news/comment")
public class CommInsertController {

	@Autowired
	private CommInsertService service;
}

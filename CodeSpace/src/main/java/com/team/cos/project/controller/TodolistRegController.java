package com.team.cos.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.service.TodolistInsertService;
import com.team.cos.project.vo.TodolistVO;


@RestController
@RequestMapping("/project/todolistReg")
public class TodolistRegController {
	
	@Autowired
	private TodolistInsertService service;

	@RequestMapping(method = RequestMethod.POST,
				consumes = "application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody TodolistVO vo) throws ParseException{
		System.out.println("todolist reg post: "+vo.getTdlstring_enddate());
		String enddate = vo.getTdlstring_enddate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(enddate);
		
		vo.setTodolist_enddate(to);
		
		
		
		int insertCount = service.register(vo);
		
		return insertCount==1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
}

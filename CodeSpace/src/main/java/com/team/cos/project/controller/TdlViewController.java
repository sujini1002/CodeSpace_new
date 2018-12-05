package com.team.cos.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.cos.project.service.TDLViewService;
import com.team.cos.project.vo.TodolistVO;

// RestController의 경우 순수 데이터를 전달하는 controller의 역할을 함
@RestController
public class TdlViewController {
	
	@Autowired
	private TDLViewService tdlService;
	
	
	//project_no에 해당하는 여러개의 to do list 가져오기
	@RequestMapping("project/tdl/{project_no}")
	public ResponseEntity<List<TodolistVO>> getList(
			@PathVariable("project_no") int project_no){

		List<TodolistVO> tdl = tdlService.getTDL(project_no);
		
		return new ResponseEntity<>(tdl, HttpStatus.OK);
	}
	
	
	//todolist_no 한개에 대한 세부 정보 가져오기
	@RequestMapping("project/oneTodolistInfo/{todolist_no}")
	public ResponseEntity<TodolistVO> getInfo(
			@PathVariable("todolist_no") int todolist_no){
		
		TodolistVO todolist = tdlService.getOneTodo(todolist_no);
		
		return new ResponseEntity<>(todolist, HttpStatus.OK);
	}
	

}

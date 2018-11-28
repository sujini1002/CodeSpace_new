package com.team.cos.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.TDLInterface;
import com.team.cos.project.vo.TodolistVO;

public class TDLViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private TDLInterface dao;

	//to do list select
	public List<TodolistVO> getTDL(int project_no) {
		dao = sqlSessionTemplate.getMapper(TDLInterface.class);
		
		List<TodolistVO> list = dao.selectTDL(project_no);
		return list;
	}
	public List<TodolistVO> h_getTDL(int project_no) {
		dao = sqlSessionTemplate.getMapper(TDLInterface.class);
		
		List<TodolistVO> list = dao.h_selectTDL(project_no);
		return list;
	}

	public TodolistVO getOneTodo(int todolist_no) {
		dao = sqlSessionTemplate.getMapper(TDLInterface.class);
		
		TodolistVO info = dao.selectOntTDL(todolist_no);
		return info;
	}
}

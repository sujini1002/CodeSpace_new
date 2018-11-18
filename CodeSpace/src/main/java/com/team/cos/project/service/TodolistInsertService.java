package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.TDLInterface;
import com.team.cos.project.vo.TodolistVO;

public class TodolistInsertService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private TDLInterface dao;
	
	
	public int register(TodolistVO vo) {
		dao = sqlSessionTemplate.getMapper(TDLInterface.class);
		
		return dao.insertTDL(vo);
	}

}

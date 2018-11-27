package com.team.cos.project.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.project.dao.TDLInterface;
import com.team.cos.project.vo.TodolistVO;

public class TodolistModifyService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private TDLInterface dao;

	public int todolistModify(TodolistVO vo) {

		dao = sqlSessionTemplate.getMapper(TDLInterface.class);
		
		int modifyCnt = dao.updateTDL(vo);
		
		return modifyCnt;
	}

}

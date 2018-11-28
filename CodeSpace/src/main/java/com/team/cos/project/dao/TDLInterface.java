package com.team.cos.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cos.project.vo.TodolistVO;

public interface TDLInterface {

	// 선택된 project_no에 해당하는 project_todolist 가져오기
	// public List<TodolistVO> selectTDL(int project_no);
	// REST 방식
	public List<TodolistVO> selectTDL(@Param("project_no") int project_no);

	public List<TodolistVO> h_selectTDL(@Param("project_no") int project_no);

	public int insertTDL(TodolistVO vo);

	public int updateTDL(TodolistVO vo);

	public TodolistVO selectOntTDL(int todolist_no);

}

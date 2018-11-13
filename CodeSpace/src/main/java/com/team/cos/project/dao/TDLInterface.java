package com.team.cos.project.dao;

import java.util.List;

import com.team.cos.project.vo.TodolistVO;

public interface TDLInterface {

	
	//선택된 project_no에 해당하는 project_todolist 가져오기
	public List<TodolistVO> selectTodoList(int project_no);
}

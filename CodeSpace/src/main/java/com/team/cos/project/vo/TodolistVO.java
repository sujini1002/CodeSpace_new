package com.team.cos.project.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TodolistVO {
	
	private int todolist_no;
	private int project_no;
	private int tdlmanager_no;
	private String todolist_content;
	private String todolist_file;
	private MultipartFile file;
	private String todolist_status;
	private Date todolist_startdate;
	private Date todolist_enddate;
	private String tdlstring_startdate; // 프로젝트 시작 날짜
	private String tdlstring_enddate; // 프로젝트 종료 날짜 
	private String user_name;
	private String user_id;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTodolist_no() {
		return todolist_no;
	}
	public void setTodolist_no(int todolist_no) {
		this.todolist_no = todolist_no;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public int getTdlmanager_no() {
		return tdlmanager_no;
	}
	public void setTdlmanager_no(int tdlmanager_no) {
		this.tdlmanager_no = tdlmanager_no;
	}
	public String getTodolist_content() {
		return todolist_content;
	}
	public void setTodolist_content(String todolist_content) {
		this.todolist_content = todolist_content;
	}
	public String getTodolist_file() {
		return todolist_file;
	}
	public void setTodolist_file(String todolist_file) {
		this.todolist_file = todolist_file;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getTodolist_status() {
		return todolist_status;
	}
	public void setTodolist_status(String todolist_status) {
		this.todolist_status = todolist_status;
	}
	public Date getTodolist_startdate() {
		return todolist_startdate;
	}
	public void setTodolist_startdate(Date todolist_startdate) {
		this.todolist_startdate = todolist_startdate;
	}
	public Date getTodolist_enddate() {
		return todolist_enddate;
	}
	public void setTodolist_enddate(Date todolist_enddate) {
		this.todolist_enddate = todolist_enddate;
	}
	public String getTdlstring_startdate() {
		return tdlstring_startdate;
	}
	public void setTdlstring_startdate(String tdlstring_startdate) {
		this.tdlstring_startdate = tdlstring_startdate;
	}
	public String getTdlstring_enddate() {
		return tdlstring_enddate;
	}
	public void setTdlstring_enddate(String tdlstring_enddate) {
		this.tdlstring_enddate = tdlstring_enddate;
	}
	@Override
	public String toString() {
		return "TodolistVO [todolist_no=" + todolist_no + ", project_no=" + project_no + ", tdlmanager_no="
				+ tdlmanager_no + ", todolist_content=" + todolist_content + ", todolist_file=" + todolist_file
				+ ", todolist_status=" + todolist_status + ", todolist_startdate=" + todolist_startdate
				+ ", todolist_enddate=" + todolist_enddate + "]";
	}

}

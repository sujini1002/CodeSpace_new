package com.team.cos.project.vo;

import java.util.Date;
import java.util.List;

public class ProjectInfoVO {

	private int project_no; // 프로젝트 고유 번호
	private String project_title; // 프로젝트 제목
	private String project_content; // 프로젝트 내용
	private boolean project_status; // 현재 프로젝트 상태 0:false(완료) 1:true(진행중)
	private Date project_startdate; // 프로젝트 시작 날짜
	private Date project_enddate; // 프로젝트 종료 날짜
	private String prostring_startdate; // 프로젝트 시작 날짜
	private String prostring_enddate; // 프로젝트 종료 날짜
	private int pm_no;
	private int user_no;
	private List<Integer> member;
	private int firstRow;
	private int endRow;
	private int revision_no; // revision 테이블의 revision 고유 번호
	private Date revision_date; // 정보 수정 날짜

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<Integer> getMember() {
		return member;
	}

	public void setMember(List<Integer> member) {
		this.member = member;
	}

	public int getProject_no() {
		return project_no;
	}

	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}

	public String getProject_title() {
		return project_title;
	}

	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}

	public String getProject_content() {
		return project_content;
	}

	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}

	public boolean isProject_status() {
		return project_status;
	}

	public void setProject_status(boolean project_status) {
		this.project_status = project_status;
	}

	public Date getProject_startdate() {
		return project_startdate;
	}

	public void setProject_startdate(Date project_startdate) {
		this.project_startdate = project_startdate;
	}

	public Date getProject_enddate() {
		return project_enddate;
	}

	public void setProject_enddate(Date project_enddate) {
		this.project_enddate = project_enddate;
	}

	public String getProstring_startdate() {
		return prostring_startdate;
	}

	public void setProstring_startdate(String prostring_startdate) {
		this.prostring_startdate = prostring_startdate;
	}

	public String getProstring_enddate() {
		return prostring_enddate;
	}

	public void setProstring_enddate(String prostring_enddate) {
		this.prostring_enddate = prostring_enddate;
	}

	public int getPm_no() {
		return pm_no;
	}

	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getRevision_no() {
		return revision_no;
	}

	public void setRevision_no(int revision_no) {
		this.revision_no = revision_no;
	}

	public Date getRevision_date() {
		return revision_date;
	}

	public void setRevision_date(Date revision_date) {
		this.revision_date = revision_date;
	}

	@Override
	public String toString() {
		return "ProjectInfoVO [project_no=" + project_no + ", project_title=" + project_title + ", project_content="
				+ project_content + ", project_status=" + project_status + ", project_startdate=" + project_startdate
				+ ", project_enddate=" + project_enddate + ", prostring_startdate=" + prostring_startdate
				+ ", prostring_enddate=" + prostring_enddate + ", pm_no=" + pm_no + ", user_no=" + user_no + ", member="
				+ member + ", firstRow=" + firstRow + ", endRow=" + endRow + "]";
	}

}

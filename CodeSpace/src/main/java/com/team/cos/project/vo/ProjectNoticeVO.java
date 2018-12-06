package com.team.cos.project.vo;

import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

public class ProjectNoticeVO {
	private int notice_no;
	private int project_no;
	private String notice_title;
	private String notice_content;
	private String notice_file;
	private SimpleDateFormat notice_regdate;
	private MultipartFile file;
	private String ops;

	public String getOps() {
		return ops;
	}

	public void setOps(String ops) {
		this.ops = ops;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getProject_no() {
		return project_no;
	}

	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_file() {
		return notice_file;
	}

	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}

	public SimpleDateFormat getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(SimpleDateFormat notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "ProjectNoticeVO [notice_no=" + notice_no + ", project_no=" + project_no + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", notice_file=" + notice_file
				+ ", notice_regdate=" + notice_regdate + ", file=" + file + ", ops=" + ops + "]";
	}
}

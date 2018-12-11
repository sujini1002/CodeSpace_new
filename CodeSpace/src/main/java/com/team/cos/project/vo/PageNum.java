package com.team.cos.project.vo;

import java.util.List;

public class PageNum {
	private int pageNum;
	private int pageTotalCont;
	private int firstRow;
	private int endRow;
	private int pageTotalCnt;
	private List<ProjectNoticeVO> noticeList;
	private int messageCountPerPage;

/*	public PageNum() {
		super();
		// TODO Auto-generated constructor stub
	}*/

/*	public PageNum(int pageNum, int pageTotalCont, int firstRow, int endRow, int pageTotalCnt,
			List<ProjectNoticeVO> noticeList) {
		this.pageNum = pageNum;
		this.pageTotalCont = pageTotalCont;
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.pageTotalCnt = pageTotalCnt;
		this.noticeList = noticeList;
		cal();
	}*/

	public void cal() {
		if (pageTotalCont == 0) {
			pageTotalCnt = 0;
		} else {
			pageTotalCnt = pageTotalCont / messageCountPerPage;
			if (pageTotalCont % messageCountPerPage > 0) {
				pageTotalCnt++;
			}
		}
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageTotalCont() {
		return pageTotalCont;
	}

	public void setPageTotalCont(int pageTotalCont) {
		this.pageTotalCont = pageTotalCont;
	}

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

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public void setPageTotalCnt(int pageTotalCnt) {
		this.pageTotalCnt = pageTotalCnt;
	}

	public List<ProjectNoticeVO> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<ProjectNoticeVO> noticeList) {
		this.noticeList = noticeList;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}

	@Override
	public String toString() {
		return "PageNum [pageNum=" + pageNum + ", pageTotalCont=" + pageTotalCont + ", firstRow=" + firstRow
				+ ", endRow=" + endRow + ", pageTotalCnt=" + pageTotalCnt + ", noticeList=" + noticeList
				+ ", messageCountPerPage=" + messageCountPerPage + "]";
	}

}

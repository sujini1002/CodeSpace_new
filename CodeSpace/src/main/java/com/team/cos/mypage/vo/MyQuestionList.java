package com.team.cos.mypage.vo;

import java.util.List;

import com.team.cos.question.vo.QuestionInfo;

public class MyQuestionList {

	private int boardTotalCount; // 전체게시글수
	private int currentPageNumber; // 페이지넘버
	private List<QuestionInfo> myQuestionList; // 글리스트
	private int pageTotalCount; // 페이지전체갯수
	private int boardCountPerPage; // 페이지당 게시글 수
	private int firstRow;
	private int endRow;

	public MyQuestionList(List<QuestionInfo> myQuestionList, int boardTotalCount, int currentPageNumber, int boardCountPerPage,
			int firstRow, int endRow) {
		
		this.myQuestionList = myQuestionList;
		this.boardTotalCount = boardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.boardCountPerPage = boardCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if(boardTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = boardTotalCount / boardCountPerPage;
			if(boardTotalCount % boardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	public boolean isEmpty() {
		return boardTotalCount == 0;
	}

	public int getBoardTotalCount() {
		return boardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<QuestionInfo> getMyQuestionList() {
		return myQuestionList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	@Override
	public String toString() {
		return "MyQuestionList [boardTotalCount=" + boardTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", myQuestionList=" + myQuestionList + ", pageTotalCount=" + pageTotalCount + ", boardCountPerPage="
				+ boardCountPerPage + ", firstRow=" + firstRow + ", endRow=" + endRow + "]";
	}
	
	
}

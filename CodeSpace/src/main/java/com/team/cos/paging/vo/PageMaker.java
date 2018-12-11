package com.team.cos.paging.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.team.cos.paging.vo.SearchCriteria;

public class PageMaker {

	private int totalCount; // 전체 데이터 개수
	private int userTotalCount; // 전체 회원수
	private int startPage; // 시작 페이지
	private int endPage; // 마지막 페이지
	private boolean prev; // 이전 페이지
	private boolean next; // 다음 페이지

	private int displayPageNum = 5; // 페이징 바에서 보여지는 페이지 번호의 개수

	private SearchCriteria searchCri;

	private UserCriteria userCri;

	// 10개씩 출력되는 게시판에 대한 전체 데이터 개수 계산
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	// 24개씩 출력되는 유저리스트에 대한 전체 데이터 개수 계산
	public int getUserTotalCount() {
		return userTotalCount;
	}

	public void setUserTotalCount(int userTotalCount) {
		this.userTotalCount = userTotalCount;

		userCalcData();
	}

	// 데이터 계산을 위한 메서드
	public void calcData() {
		// 게시판 페이징의 마지막 페이지 번호 = Math.ceil(현재 페이지 번호 / 보여지는 페이지 번호의 수) * 보여지는 페이지 번호의 수
		// ex) 현재 페이지 번호가 5라면 Math.ceil(5/10) * 10 => 1(0.5를 올림한 결과) * 10 = 10
		// 결국 현재 페이지번호가 5인 페이징 넘버의 마지막 페이지번호는 10이 된다.
		// 현재 페이지 번호가 12일 경우 Math.ceil(12/10) * 10 => 2 * 10 = 20 페이지가 마지막 페이지 넘버
		endPage = (int) (Math.ceil(searchCri.getPage() / (double) displayPageNum) * displayPageNum);

		// 게시판 페이징의 시작 페이지 번호 = (마지막페이지 - 보여지는 페이지 번호의 개수) + 1
		// ex) 마지막페이지가 10, 보여지는 페이지번호의 개수가 10 이라면
		// (10 - 10) + 1 = 1, 즉 시작페이지 번호는 1이 된다.
		startPage = (endPage - displayPageNum) + 1;

		// 게시판의 실제 마지막 페이지 번호 = Math.ceil(전체 데이터 개수/한 페이지에서 보여줄 데이터 개수)
		// ex) 전체 데이터 개수가 131, 한 페이지에서 보여줄 데이터 개수가 10일 경우
		// Math.ceil(131/10) = Math.ceil(13.1) = 14
		// 즉 13페이지까지 10개씩 데이터가 출력되고, 마지막 14페이에서 나머지 1개의 데이터가 출력되므로
		// 보여지는 페이징 번호가 처음에 1~10 표시 다음부터는 11~14까지만 표시되는 것
		int tempEndPage = (int) (Math.ceil(totalCount / (double) searchCri.getPerPageNum()));

		// 게시판 페이징의 마지막 페이지번호가 실제 마지막 페이지 번호보다 높을 경우
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// 이전 버튼은 시작 페이지가 1일경우에만 비활성화, 그 외에는 활성화
		prev = startPage == 1 ? false : true;

		// 다음 버튼은 마지막 페이지 * 한 페이지당 보여줄 데이터 개수 >= 전체 데이터 개수일 경우 비활성화
		// 그 외에는 활성화
		next = endPage * searchCri.getPerPageNum() >= totalCount ? false : true;

	}

	// 유저 수 데이터 계산을 위한 메서드
	public void userCalcData() {
		endPage = (int) (Math.ceil(userCri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(userTotalCount / (double) userCri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * userCri.getPerPageNum() >= userTotalCount ? false : true;

	}

	// 일반 게시글 Parameter 값(page, perPageNum 등)을 유지하기 위한 메서드
	public String makeQuery(int page) throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", searchCri.getPerPageNum()).queryParam("filter", searchCri.getFilter())
				.build();

		return uriComponents.toUriString();
	}

	// 게시물 검색 시 해당 Parameter 값을 유지하기 위한 메서드
	public String makeSearch(int page) throws Exception {

		UriComponents uriComponents = null;

		if (searchCri != null) {

			uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
					.queryParam("perPageNum", searchCri.getPerPageNum())
					.queryParam("keyword", encoding(((SearchCriteria) searchCri).getKeyword())).build();

		} else {

			uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
					.queryParam("perPageNum", userCri.getPerPageNum()).build();
		}

		return uriComponents.toUriString();

	}

	// 검색 없는 유저리스트 Param 값(page, perPageNum 등)을 유지하기 위한 메서드
	public String makeUserList(int page) throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", userCri.getPerPageNum()).queryParam("viewType", userCri.getViewType())
				.build();

		return uriComponents.toUriString();
	}

	// 유저 페이지 Parameter 값 유지
	public String makeUser(int page) throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", userCri.getPerPageNum())
				.queryParam("user_nickname", encoding(((UserCriteria) userCri).getUser_nickname())).build();

		return uriComponents.toUriString();
	}

	public String makeTag(int page) throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", searchCri.getPerPageNum()).queryParam("tag", searchCri.getTag()).build();

		return uriComponents.toUriString();
	}

	// 검색 창 검색 시 검색어 관련 encoding
	private String encoding(String keyword) {

		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "utf-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public SearchCriteria getSearchCri() {
		return searchCri;
	}

	public void setSearchCri(SearchCriteria searchCri) {
		this.searchCri = searchCri;
	}

	public UserCriteria getUserCri() {
		return userCri;
	}

	public void setUserCri(UserCriteria userCri) {
		this.userCri = userCri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", userTotalCount=" + userTotalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", searchCri=" + searchCri + ", userCri=" + userCri + "]";
	}

}
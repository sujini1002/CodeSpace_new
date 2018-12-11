package com.team.cos.paging.dao;

import java.util.List;

import com.team.cos.paging.vo.Criteria;
import com.team.cos.paging.vo.SearchCriteria;
import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectNoticeVO;

public interface PagingDaoInterface {

	public List listCriteria(SearchCriteria cri); 	// 전체 게시물 리스트를 불러오기 위한 메서드
	
	public int countPaging(SearchCriteria cri); 	// 전체 게시물을 Count 하기 위한 쿼리
	
	// 프로젝트 
	public List projectListCriteria(SearchCriteria cri);
	public int projectCountPaging(SearchCriteria cri);
	
	//공지사항
	public List<ProjectNoticeVO> projectNoticeView(ProjectInfoVO projectInfoVO);
}

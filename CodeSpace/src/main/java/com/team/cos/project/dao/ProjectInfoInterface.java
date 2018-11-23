package com.team.cos.project.dao;

import java.util.List;

import com.team.cos.project.vo.ProjectInfoVO;
import com.team.cos.project.vo.ProjectMemberVO;
import com.team.cos.project.vo.ProjectNoticeVO;

public interface ProjectInfoInterface {

	// project_no와 일치하는 프로젝트 정보를 보여주는 메서드
	public ProjectInfoVO selectProjectList(int project_no);
	public ProjectInfoVO selectAllProjectList(int project_no);

	// project insert
	public int insertProject(ProjectInfoVO vo);

	// 프로젝트 정보 업데이트
	public int updateProject(ProjectInfoVO vo);

	// 프로젝트 상태 변경
	public int updateProStatus(int project_no);

	// 로그인한 사용자가 참여중인 project 정보를 보여주는 메서드
	public List<ProjectInfoVO> selectUserPro(int user_no);
	public List<ProjectInfoVO> selectPmProject(int pm_no);

	// 로그인한 사용자가 참여중인 project_no를 보여줌 >> project, project_member table left join으로 함
	public List<Integer> selectProjectNo(int user_no);
	
	// 사용자 정보 project에 insert
	public int memberUpdate(ProjectMemberVO vo);

	// project notice view
	public List<ProjectNoticeVO> projectNoticeView(ProjectInfoVO projectInfoVO);

	// 공지사항 글 클릭했을떄 세부내용
	public ProjectNoticeVO noticeDetailView(ProjectNoticeVO projectNoticeVO);

	// 공지사항 글 삭제
	public int noticeDelete(ProjectNoticeVO projectNoticeVO);

	// PM 체크
	public ProjectInfoVO checkPm(ProjectInfoVO projectInfoVO);
	
	// project에 참여중인 member list 표출하기
	public List<ProjectMemberVO> selectMember(int project_no);
}

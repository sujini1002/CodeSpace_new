package com.team.cos.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.mypage.dao.UsersActDao;
import com.team.cos.mypage.vo.MyAnsInfo;
import com.team.cos.mypage.vo.UsersActCriteria;
import com.team.cos.question.vo.QuestionInfo;
import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class UsersPageService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;
	private UsersActDao dao;

	// user_no으로 사용자 정보 가져오기
	public UserInfoVo getUsersPage(int user_no) {

		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		UserInfoVo users = mypageInterface.getUsersPage(user_no);
		return users;
	}

	// 사용자가 한 질문 가져오기
	public List<QuestionInfo> getUsersQst(int user_no, UsersActCriteria cri) {

		dao = sqlSessionTemplate.getMapper(UsersActDao.class);
		cri.setUser_no(user_no);
		cri.setStartNum(cri.getPageStart());
		List<QuestionInfo> qstList = dao.getUsersQst(cri);
		return qstList;

	}

	// 사용자가 한 질문 카운트
	public int countUsersQst(int user_no, UsersActCriteria cri) {

		dao = sqlSessionTemplate.getMapper(UsersActDao.class);
		int qstCnt = dao.countUsersQst(user_no, cri);
		return qstCnt;
	}

	// 사용자가 한 답변 가져오기
	public List<MyAnsInfo> getUsersAns(int user_no, UsersActCriteria cri) {

		dao = sqlSessionTemplate.getMapper(UsersActDao.class);
		cri.setUser_no(user_no);
		cri.setStartNum(cri.getPageStart());
		List<MyAnsInfo> ansList = dao.getUsersAns(cri);
		return ansList;

	}

	// 사용자가 한 답변 카운트
	public int countUsersAns(int user_no, UsersActCriteria cri) {

		dao = sqlSessionTemplate.getMapper(UsersActDao.class);
		int ansCnt = dao.countUsersAns(user_no, cri);
		return ansCnt;
	}
	
	// 스코어 상위 10명 뽑기
	public List<UserInfoVo> getTopTen(){
		dao = sqlSessionTemplate.getMapper(UsersActDao.class);
		List<UserInfoVo> topList = dao.getTopTen();
		return topList;
		
	}

}

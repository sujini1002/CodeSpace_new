package com.team.cos.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.project.vo.ProjectInfoVO;

public class MyprjService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;
	
	// 내가 참여한 프로젝트 정보 가져오기
	public List<ProjectInfoVO> getMyprj(int user_no){
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		
		//user_no에 해당하는 project list 가져옴
		List<ProjectInfoVO> myPrjList = mypageInterface.getProjectByProject(user_no);
		
		return myPrjList;
	}
}

package com.team.cos.mypage.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class DeleteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;
	
		
	// 탈퇴하기 처리
	@Transactional
	public boolean delete(String inputuser_id, String user_id, HttpSession session) throws IOException {
		
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		
		boolean result = false; 
		
		// session에 저장된 id로 유저 정보 가져옴
		UserInfoVo userInfoVo = mypageInterface.getUserInfo(user_id);

		// 입력한 id와  DB의 id 비교
		if(userInfoVo != null && userInfoVo.getUser_id().equals(inputuser_id)) {
			mypageInterface.memberDelete(user_id);
			session.invalidate();
			result = true;
		
		} else {
			result = false;
		}
		return result;
		
	}
}

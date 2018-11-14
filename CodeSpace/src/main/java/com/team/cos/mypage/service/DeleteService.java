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
		System.out.println("delete 서비스 들어옴");
		
		System.out.println("사용자 입력 값: "+inputuser_id); 
		System.out.println("로그인 유저 아이디: "+user_id);
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		
		boolean result = false; 
		
		// session에 저장된 id로 유저 정보 가져옴
		UserInfoVo userInfoVo = mypageInterface.getUserInfo(user_id);

		// 입력한 id와  DB의 id 비교
		if(userInfoVo != null && userInfoVo.getUser_id().equals(inputuser_id)) {
			System.out.println("사용자정보같음. 삭제진행");
			mypageInterface.memberDelete(user_id);
			session.invalidate();
			result = true;
		
		} else {
			System.out.println("사용자 정보 다름");
		
			result = false;
		}
		return result;
		
	}
}

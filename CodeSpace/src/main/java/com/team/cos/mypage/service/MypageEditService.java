package com.team.cos.mypage.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

public class MypageEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;

	// 회원 정보 가져오기
	public UserInfoVo getUserInfo(String user_id) {

		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		UserInfoVo userInfoVo = mypageInterface.getUserInfo(user_id);
		return userInfoVo;

	}

	// 수정된 정보 저장하기
	@Transactional
	public void getEditForm(UserInfoVo userInfoVo, HttpServletRequest request) {

		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);

		/* 사진처리 - 파일 경로 신경쓰자 */
		/*
		 * String uploadUri = "/uploadfile/userphoto"; String dir1 =
		 * request.getSession().getServletContext().getRealPath(uploadUri); String
		 * photoName = "";
		 * 
		 * if(!userInfoVo.getPhoto().isEmpty()) { photoName = userInfoVo.getUser_id() +
		 * "_"+ userInfoVo.getPhoto().getOriginalFilename();
		 * userInfoVo.getPhoto().transferTo(new File(dir1, photoName ));
		 * 
		 * userInfoVo.setUser_photo(photoName); }
		 */
		mypageInterface.update(userInfoVo);
	}

}

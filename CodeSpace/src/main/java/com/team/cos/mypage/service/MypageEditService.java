package com.team.cos.mypage.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.mypage.dao.MypageInterface;
import com.team.cos.userinfo.service.AES256UtilService;
import com.team.cos.userinfo.vo.UserInfoVo;

public class MypageEditService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private MypageInterface mypageInterface;
	
	@Autowired
	private AES256UtilService service;

	// 회원 정보 가져오기
	public UserInfoVo getUserInfo(String user_id) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		UserInfoVo userInfoVo = mypageInterface.getUserInfo(user_id);
		userInfoVo.setUser_pw(service.decrypt(userInfoVo.getUser_pw()));
		return userInfoVo;

	}

	// 수정된 정보 저장하기
	@Transactional
	public int edit(UserInfoVo userInfoVo, HttpServletRequest request) throws IllegalStateException, IOException {

		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);

		/* 사진처리 - 파일 경로 신경쓰자 */
		
//		  String uploadUri = "/uploadfile/userphoto"; 
//		  String dir1 = request.getSession().getServletContext().getRealPath(uploadUri);
//		  //System.out.println(dir1);
//		  String photoName = "";
//		  
//		 if(!userInfoVo.getPhoto().isEmpty()) { 
//			  photoName = userInfoVo.getUser_no() + "_"+ userInfoVo.getPhoto().getOriginalFilename();
//			  userInfoVo.getPhoto().transferTo(new File(dir1, photoName ));
//		  
//			  userInfoVo.setUser_photo(photoName); 
//		  }
		
		String tag = userInfoVo.getUser_tag();
		if(!tag.equals(null)) {
			tag = tag.toLowerCase();
			if(tag.contains("javascript")) {
				tag = tag.replace("javascript", "Javascript");
			}else if(tag.contains("/javascript")) {
				tag = tag.replace("/javascript", "/Javascript");
			}else if(tag.contains("c")) {
				tag = tag.replace("c", "C");
			}else if(tag.contains("/c")) {
				tag = tag.replace("/c", "/C");
			}else if(tag.contains("c++")) {
				tag = tag.replace("c++", "C++");
			}else if(tag.contains("/c++")) {
				tag = tag.replace("/c++", "/C++");
			}else if(tag.contains("c#")) {
				tag = tag.replace("c#", "C#");
			}else if(tag.contains("/c#")) {
				tag = tag.replace("/c#", "/C#");
			}
			 
		}
		userInfoVo.setUser_tag(tag);
		 
		return mypageInterface.update(userInfoVo);
	}
/*	@Transactional
	public void edit(UserInfoVo userInfoVo, HttpServletRequest request) throws IllegalStateException, IOException {
		
		mypageInterface = sqlSessionTemplate.getMapper(MypageInterface.class);
		
		 사진처리 - 파일 경로 신경쓰자 
		
//		  String uploadUri = "/uploadfile/userphoto"; 
//		  String dir1 = request.getSession().getServletContext().getRealPath(uploadUri);
//		  //System.out.println(dir1);
//		  String photoName = "";
//		  
//		 if(!userInfoVo.getPhoto().isEmpty()) { 
//			  photoName = userInfoVo.getUser_no() + "_"+ userInfoVo.getPhoto().getOriginalFilename();
//			  userInfoVo.getPhoto().transferTo(new File(dir1, photoName ));
//		  
//			  userInfoVo.setUser_photo(photoName); 
//		  }
		
		mypageInterface.update(userInfoVo);
	}
*/
}

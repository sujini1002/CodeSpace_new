package com.team.cos.userinfo.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.cos.userinfo.dao.UserInfoInterface;
import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class UserInfoRegService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private UserInfoInterface data;

	@Transactional
	public int insertUserInfo(UserInfoVo userInfoVo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		data = sqlSessionTemplate.getMapper(UserInfoInterface.class);
		String tag = userInfoVo.getUser_tag();
		if (!tag.equals(null)) {
			tag = tag.toLowerCase();
			if (tag.contains("javascript")) {
				tag = tag.replace("/javascript", "/Javascript");
			}else if(tag.contains("c")) {
				tag = tag.replace("/c", "/C");
			}else if(tag.contains("c++")) {
				tag = tag.replace("/c++", "/C++");
			}else if(tag.contains("c#")) {
				tag = tag.replace("/c#", "/C#");
			} 
		}
		userInfoVo.setUser_tag(tag);
//		// DB에 이미지 저장할 이름
//		String dbImage = "";
//
//		// 물리적 저장경로
//		String uploadUri = "/uploadfile/userphoto";
//		
//		// uploadUri의 시스템 경로
//		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
//		System.out.println("시스템경로:" + dir);
//
////		사진이 있다면
//		if (!userInfoVo.getPhoto().isEmpty()) {
//			dbImage = userInfoVo.getUser_id() + "_" + userInfoVo.getPhoto().getOriginalFilename();
//
////			물리적 저장
//			userInfoVo.getPhoto().transferTo(new File(dir, dbImage));
//
////			db에 저장
//			userInfoVo.setUser_photo(dbImage);
//		}

		return data.insertUserInfo(userInfoVo);
	}

}

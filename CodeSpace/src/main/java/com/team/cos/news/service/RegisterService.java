package com.team.cos.news.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cos.news.dao.NewsDao;
import com.team.cos.news.vo.NewsInfo;

@Service
public class RegisterService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private NewsDao dao;
	
	public int writeNews(NewsInfo newsInfo, HttpServletRequest request) throws IllegalStateException, IOException {
		dao = sqlSessionTemplate.getMapper(NewsDao.class);
		
		int resultCnt = 0;
				
		/*String uploadUri = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);

		String photoName = ""; // 파일명
		
		if(!newsInfo.getN_photo().isEmpty()) { 
			  photoName = newsInfo.getN_no() + "_"+ newsInfo.getN_photo().getOriginalFilename();
			  
			  newsInfo.getN_photo().transferTo(new File(dir, photoName ));
		  
			  newsInfo.setN_pic(photoName); 
			  
			  System.out.println(dir);
		  }*/
		
		resultCnt = dao.writeNews(newsInfo);
		
		
		
		
		System.out.println("등록 서비스 탐");
		return resultCnt;
	}
}

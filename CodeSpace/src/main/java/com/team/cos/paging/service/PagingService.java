package com.team.cos.paging.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.paging.dao.PagingDaoInterface;
import com.team.cos.paging.vo.Criteria;
import com.team.cos.paging.vo.SearchCriteria;

public class PagingService { 
       
   @Autowired  
   SqlSessionTemplate sqlSessionTemplate;
   
   private PagingDaoInterface pagingDao;
   
   ////////////////////////// Quetsions 페이지 페이징 //////////////////////////////////
   
   
   // 조건 없이 전체 데이터를 가져오는 메서드
   public List listCriteria(SearchCriteria cri) {
      
      pagingDao = sqlSessionTemplate.getMapper(PagingDaoInterface.class);
      
      List list = pagingDao.listCriteria(cri);
      
      return list;
       
   }
   
   // 조건 없이 전체 데이터의 개수를 카운트 하는 메서드
   public int listCountCriteria(SearchCriteria cri) {
	   
	   pagingDao = sqlSessionTemplate.getMapper(PagingDaoInterface.class);
	   
	   int resultCnt = pagingDao.countPaging(cri);
	   
	   return resultCnt;
	   
   }
   
}
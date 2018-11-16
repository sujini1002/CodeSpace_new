package com.team.cos.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.search.dao.SearchDaoInterface;
import com.team.cos.search.vo.Criteria;

public class PagingService { 
       
   @Autowired  
   SqlSessionTemplate sqlSessionTemplate;
   
   private SearchDaoInterface searchDao;
   
   public List listCriteria(Criteria cri) {
      
      searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
      
      List paging = searchDao.listCriteria(cri);
      
      return paging;
       
   }
   
   public int listCountCriteria(Criteria cri) {
	   
	   searchDao = sqlSessionTemplate.getMapper(SearchDaoInterface.class);
	   
	   int resultCnt = searchDao.countPaging(cri);
	   
	   return resultCnt;
	   
   }
   
}
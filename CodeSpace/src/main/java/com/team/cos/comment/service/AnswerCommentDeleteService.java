package com.team.cos.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.comment.dao.AnswerCommentInterfaceDao;
import com.team.cos.comment.vo.AnswerCommentInfo;

public class AnswerCommentDeleteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerCommentInterfaceDao ansCommDao;
	
	public int delete(int ac_no) {
		ansCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		return ansCommDao.deleteAc(ac_no);
	}
	public int findANum(int ac_no) {
		ansCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		return ansCommDao.findAnswerNum(ac_no);
	}
	public List<AnswerCommentInfo> listAll(int a_no){
		
		ansCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		
		List<AnswerCommentInfo> list = new ArrayList<AnswerCommentInfo>();
		list = ansCommDao.anCommListOneAnswer(a_no);
		
		return list;
	}
	public int count(int a_no) {
		ansCommDao = sqlSessionTemplate.getMapper(AnswerCommentInterfaceDao.class);
		
		return ansCommDao.countAnswerComm(a_no);
	}
}

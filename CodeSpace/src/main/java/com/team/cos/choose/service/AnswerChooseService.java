package com.team.cos.choose.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.choose.dao.AnswerChooseInterfaceDao;

public class AnswerChooseService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerChooseInterfaceDao answChooseDao;
	
	public int selectQNo(int a_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);
		return answChooseDao.selectQNo(a_no);
	}
	public int isExistChoose(int q_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);
		return answChooseDao.isExistChoose(q_no);
	}
	public int Choose(int a_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);
		return answChooseDao.Choose(a_no);
	}
	public int findUser(int a_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);
		return answChooseDao.findUser(a_no);
	}
	public int updateUserScore(int user_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);
		return answChooseDao.updateUserScore(user_no);
	}
}

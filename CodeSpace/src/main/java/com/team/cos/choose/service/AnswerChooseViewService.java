package com.team.cos.choose.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.choose.dao.AnswerChooseInterfaceDao;

public class AnswerChooseViewService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AnswerChooseInterfaceDao answChooseDao;

	public int viewChoose(int q_no) {

		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);

		return answChooseDao.choosedAnswer(q_no);
	}

	public int choosedCnt(int q_no) {
		answChooseDao = sqlSessionTemplate.getMapper(AnswerChooseInterfaceDao.class);

		return answChooseDao.choosedCnt(q_no);
	}
}

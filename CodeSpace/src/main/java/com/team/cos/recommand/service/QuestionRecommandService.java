package com.team.cos.recommand.service;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.recommand.dao.QuestionRecommandInterfaceDao;
import com.team.cos.recommand.vo.QuestionRecommandInfo;

public class QuestionRecommandService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private QuestionRecommandInterfaceDao quesRecomDao;
	
	//테이블에 특정 질문에 대한 사용자의 레코드가 있는지 확인
	public int isExistUserRecom(QuestionRecommandInfo questionRecommandInfo) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.isExistUserRecom(questionRecommandInfo);
	}
	
	//테이블에 특정 질문에 대한 사용자의 레코드가 없을 때 새로운 레코드 생성
	public int insertUserRecom(QuestionRecommandInfo questionRecommandInfo) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.insertUserRecom(questionRecommandInfo);
	}
	
	//테이블에 존재 한다면 현재 추천 상태 파악
	public int isUserStatus(QuestionRecommandInfo questionRecommandInfo) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.isUserStatus(questionRecommandInfo);
	}
	
	//질문 추천 수 업데이트
	public int updateQuestionScore(int q_no,int score) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.updateQuestionScore(q_no,score);
	}
	//최종적으로 계산 된 질문 추천 수
	public int finalQuesRecomNum(int q_no) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.finalQuesRecomNum(q_no);
	}
	//질문 추천 테이블의 사용자의 추천여부 변경
	public int changeUserStatus(QuestionRecommandInfo questionRecommandInfo) {
		
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.changeUserStatus(questionRecommandInfo);
	}
	//사용자의 추천/비추천 여부 저장
	public int UserUpdown(QuestionRecommandInfo questionRecommandInfo) {
		quesRecomDao = sqlSessionTemplate.getMapper(QuestionRecommandInterfaceDao.class);
		
		return quesRecomDao.UserUpdown(questionRecommandInfo);
	}
	
}

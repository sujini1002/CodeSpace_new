package com.team.cos.recommand.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cos.recommand.dao.AnswerRecommandInterfaceDao;
import com.team.cos.recommand.vo.AnswerRecommandInfo;

public class AnswerRecommandService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private AnswerRecommandInterfaceDao answRecomDao;
	
		//테이블에 특정 질문에 대한 사용자의 레코드가 있는지 확인
		public int isExistUserRecom(AnswerRecommandInfo questionRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.isExistUserRecom(questionRecommandInfo);
		}
		
		//테이블에 특정 질문에 대한 사용자의 레코드가 없을 때 새로운 레코드 생성
		public int insertUserRecom(AnswerRecommandInfo answerRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.insertUserRecom(answerRecommandInfo);
		}
		
		//테이블에 존재 한다면 현재 추천 상태 파악
		public int isUserStatus(AnswerRecommandInfo answerRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.isUserStatus(answerRecommandInfo);
		}
		
		//질문 추천 수 업데이트
		public int updateAnswerScore(int a_no,int score) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.updateAnswerScore(a_no,score);
		}
		//최종적으로 계산 된 질문 추천 수
		public int finalAnswRecomNum(int a_no) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.finalAnswRecomNum(a_no);
		}
		//질문 추천 테이블의 사용자의 추천여부 변경
		public int changeUserStatus(AnswerRecommandInfo answerRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.changeUserStatus(answerRecommandInfo);
		}
		//사용자의 추천/비추천 여부 저장
		public int UserUpdown(AnswerRecommandInfo answerRecommandInfo) {
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.UserUpdown(answerRecommandInfo);
		}
}

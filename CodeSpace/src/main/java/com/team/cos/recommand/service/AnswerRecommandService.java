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
		public int isExistUserRecom(AnswerRecommandInfo answerRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.isExistUserRecom(answerRecommandInfo);
		}
		
		//테이블에 특정 질문에 대한 사용자의 레코드가 없을 때 새로운 레코드 생성
		public int insertUserRecom(AnswerRecommandInfo answerRecommandInfo) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.insertUserRecom(answerRecommandInfo);
		}
		
		//이미 존재하는  행 삭제 - 추천/비추천 해제
		public void deleteUserRecom(int a_no,int user_no) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			answRecomDao.deleteUserRecom(a_no,user_no);
		}
		
		//질문 추천 수 업데이트
		public int updateAnswerScore(int a_no) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.updateAnswerScore(a_no);
		}
		//최종적으로 계산 된 질문 추천 수
		public int finalAnswRecomNum(int a_no) {
			
			answRecomDao = sqlSessionTemplate.getMapper(AnswerRecommandInterfaceDao.class);
			
			return answRecomDao.finalAnswRecomNum(a_no);
		}
		
		
}

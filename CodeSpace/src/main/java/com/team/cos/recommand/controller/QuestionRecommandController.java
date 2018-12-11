package com.team.cos.recommand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.recommand.service.QuestionRecommandService;
import com.team.cos.recommand.vo.QuestionRecommandInfo;

@Controller
public class QuestionRecommandController {
	
	@Autowired
	private QuestionRecommandService service;
	
	@RequestMapping(value="/question/questionRecommand",method=RequestMethod.POST)
	@ResponseBody
	public QuestionRecommandInfo recommand(QuestionRecommandInfo questionRecommandInfo) {
		
		
		int score = questionRecommandInfo.getScore();
		int q_no = questionRecommandInfo.getQ_no();
		int status = questionRecommandInfo.getStatus();
		int q_updown = score==1?1:0;
		
		
		//반환할  QuestionRecommandInfo 생성
		QuestionRecommandInfo result = new QuestionRecommandInfo();
		
		//question_recom테이블에 기존 회원이 해당질문에 대한 레코드가  있는지 체크 
		int isExist = service.isExistUserRecom(questionRecommandInfo);
		
		if(isExist ==0) {
			//없으면 인서트 하여 추천여부를 0으로 하기
			//updown을 요청 받은 객체에 저장
		    questionRecommandInfo.setQ_updown(q_updown);
			service.insertUserRecom(questionRecommandInfo);
			//점수 없데이트 하기
			service.updateQuestionScore(q_no,score);
			//최종 결과 값 저장하기
			result.setQ_recommand(service.finalQuesRecomNum(q_no));
			result.setQ_no(q_no);
		}else {
			//테이블에 질문번호와 사용자 번호가 일치하는 레코드가 존재
			//사용자 번호와 질문번호가 일치하는 q_isrecommand에 값을 확인
			int userStatus = service.isUserStatus(questionRecommandInfo);
			if(userStatus == 0) {
				//추천해제 할 때
				//q_isrecommand가 0일때(추천한 상태일때) : status값이 1이면 질문 추천수를  -1 하고 -1이면  질문 추천수를 +1한다.
				service.updateQuestionScore(q_no,status);
				//q_isrecommand를 0에서 1로 바꾼다.
				questionRecommandInfo.setQ_isrecommand(1);
				//q_updown을 3으로 변경한다.
				questionRecommandInfo.setQ_updown(3);
				//q_isrecommand를 0에서 1로 바꾼다.
				service.changeUserStatus(questionRecommandInfo);
				service.UserUpdown(questionRecommandInfo);
				
				//최종 결과 값을 저장
				result.setQ_recommand(service.finalQuesRecomNum(q_no));
				result.setQ_isrecommand(1);
				result.setQ_no(q_no);
			}else {
				//q_isrecommand가 1일때 (추천 안한 상태일때): score을 질문 추천 수에 업데이트 한다.
				service.updateQuestionScore(q_no, score);
				//q_isrecommand를 1에서 0으로 바꾼다.
				//사용자의 추천 /비추천 여부를 저장
				questionRecommandInfo.setQ_isrecommand(0);
				questionRecommandInfo.setQ_updown(q_updown);
				service.changeUserStatus(questionRecommandInfo);
				service.UserUpdown(questionRecommandInfo);
				//최종 결과 값을 저장
				result.setQ_recommand(service.finalQuesRecomNum(q_no));
				result.setQ_isrecommand(0);
				result.setQ_no(q_no);
			}
			
		}
		return result;
	}
}

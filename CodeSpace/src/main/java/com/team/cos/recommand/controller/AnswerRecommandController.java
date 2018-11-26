package com.team.cos.recommand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.recommand.service.AnswerRecommandService;
import com.team.cos.recommand.vo.AnswerRecommandInfo;

@Controller
public class AnswerRecommandController {

	@Autowired
	private AnswerRecommandService service;

	@RequestMapping(value = "/answer/answerRecommand", method = RequestMethod.POST)
	@ResponseBody
	public AnswerRecommandInfo recommand(AnswerRecommandInfo answerRecommandInfo) {
		System.out.println("컨트롤러에서 요청 받은 값" + answerRecommandInfo);

		int score = answerRecommandInfo.getScore();
		int a_no = answerRecommandInfo.getA_no();
		int status = answerRecommandInfo.getStatus();
		int a_updown = score == 1 ? 1 : 0;

		// 반환할 answerRecommandInfo 생성
		AnswerRecommandInfo result = new AnswerRecommandInfo();

		// question_recom테이블에 기존 회원이 해당질문에 대한 레코드가 있는지 체크
		int isExist = service.isExistUserRecom(answerRecommandInfo);

		if (isExist == 0) {
			// 없으면 인서트 하여 추천여부를 0으로 하기
			// updown을 요청 받은 객체에 저장
			answerRecommandInfo.setA_updown(a_updown);
			service.insertUserRecom(answerRecommandInfo);
			// 점수 없데이트 하기
			service.updateAnswerScore(a_no, score);
			// 최종 결과 값 저장하기
			result.setA_recommand(service.finalAnswRecomNum(a_no));
			result.setA_no(a_no);
		} else {
			// 테이블에 질문번호와 사용자 번호가 일치하는 레코드가 존재
			// 사용자 번호와 질문번호가 일치하는 q_isrecommand에 값을 확인
			int userStatus = service.isUserStatus(answerRecommandInfo);
			if (userStatus == 0) {
				// 추천해제 할 때
				// q_isrecommand가 0일때(추천한 상태일때) : status값이 1이면 질문 추천수를 -1 하고 -1이면 질문 추천수를 +1한다.
				service.updateAnswerScore(a_no, status);
				// q_isrecommand를 0에서 1로 바꾼다.
				answerRecommandInfo.setA_isrecommand(1);
				// q_updown을 3으로 변경한다.
				answerRecommandInfo.setA_updown(3);
				// q_isrecommand를 0에서 1로 바꾼다.
				service.changeUserStatus(answerRecommandInfo);
				service.UserUpdown(answerRecommandInfo);

				// 최종 결과 값을 저장
				result.setA_recommand(service.finalAnswRecomNum(a_no));
				result.setA_isrecommand(1);
				result.setA_no(a_no);
			} else {
				// q_isrecommand가 1일때 (추천 안한 상태일때): score을 질문 추천 수에 업데이트 한다.
				service.updateAnswerScore(a_no, score);
				// q_isrecommand를 1에서 0으로 바꾼다.
				// 사용자의 추천 /비추천 여부를 저장
				answerRecommandInfo.setA_isrecommand(0);
				answerRecommandInfo.setA_updown(a_updown);
				service.changeUserStatus(answerRecommandInfo);
				service.UserUpdown(answerRecommandInfo);
				// 최종 결과 값을 저장
				result.setA_recommand(service.finalAnswRecomNum(a_no));
				result.setA_isrecommand(0);
				result.setA_no(a_no);
			}

		}
		System.out.println("최종 result 상태 = " + result);
		return result;
	}
}

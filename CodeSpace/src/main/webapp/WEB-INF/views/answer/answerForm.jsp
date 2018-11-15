<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table style="width: 100%; margin-top: 80px">
	<!-- 답변시작 -->
	<tr>
		<td colspan="2">
			<!-- 답변 갯수 -->
			<div class="k_AnswerCnt">
				<b> 답변들</b>
			</div>
			<!-- 정렬 순 -->
			<div class="k_orderNavBar">
				<ul class="nav nav-pills">
					<li role="presentation" class="active"><a href="#">활동순</a></li>
					<li role="presentation"><a href="#">추천수</a></li>
					<li role="presentation"><a href="#">조회순</a></li>
				</ul>
			</div>
		
		</td>
	</tr>
	<tr>
		<!-- 답변 추천 -->
		<td rowspan="3" style="width:15%;text-align:center">
			<div id="k_Arecommand">
				<button type="button" class="btn" style="background-color: white">
					<i class="fa fa-chevron-up fa-2x" style="color: gray;"></i>
				</button>
				<h3>0</h3>
				<button type="button" class="btn" style="background-color: white">
					<i class="fa fa-chevron-down fa-2x" style="color: gray;"></i>
				</button>
			</div>
			<!-- 답변 채택  -->
			<div id="k_Choose" style="margin-top: 10px">
				<button type="button" class="btn" style="background-color: white">
					<i class="fas fa-check fa-2x" style="color:gray"></i>
				</button>
			</div>
		</td>
		<!-- 답변 내용 -->
		<td style="width:85%;">
			 
		</td>
	</tr>
	<tr>
		<!-- 답변 수정 / 답변 작성자 -->
		<td style="width: 85%;height:30px">
				<button type="button" id="k_AnswerUpdate"
					class="btn btn-primary k_AnswerContentBtn"
					onclick="">수정</button>
			<!-- 답변 작성자 정보 -->
			<jsp:include page="../question/questionUser.jsp" />
		</td>
		
	</tr>
	<tr>
		<!-- 답변 댓글 -->
		<td>
			<!-- 댓글 인클루드 -->
		</td>
	</tr>
	<!-- 답변끝 -->
</table>

<!-- 답변 작성 -->
<div id="k_insertQuestion">
 <h4>${loginInfo.user_nickname}님의 답변</h4>
 <div id="k_AnswerEditor">
 	
 </div>
 <input type="text" name="a_tag"  id="a_tag" placeholder="태그를 입력해 주세요"  class="form-control" required/>
 <button type="button" id="k_saveAnswer"
	class="btn btn-primary">답변 등록</button>
</div>
<script>
	
	var toolbarOptions =[
		['bold','italic','underline','strike'],
		
		['blockquote','code-block'],
		[{'header':[1,2,3,4,5,6,false]}],
		[{'list':'ordered'},{'list':'bullet'}],
		[{'script':'sub'},{'script':'super'}],
		[{'indent':'-1'},{'indent':'+1'}],
		[{'direction' :'rtl'}],
		['link','image','formula'],
		[{'color':[]},{'background':[]}],
		[{'font':[]}],
		[{'align':[]}]
	];

	var Answerquill = new Quill('#k_AnswerEditor',{
		modules :{
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
	
	
	$('#k_saveAnswer').click(function(){
		//질문 고유 번호
		var q_no = $('#k_qNO').val();
		var userno = '${loginInfo.user_no}';
		var content = JSON.stringify(Answerquill.getContents());
		var tag = $('#a_tag').val();
		//테스트
		
		
		 /*  $.ajax({
			url:'${pageContext.request.contextPath}/answer/insertAnswer',
			type:'POST',
			data:{
				"q_no":q_no,
				"user_no":userno,
				"a_content":content,
				"a_tag":tag
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success:function(data){
				location.href='${pageContext.request.contextPath}/question/questionView?q_no='+data.q_no;
			},
			error:function(){
				alert('불행하게도 에러입니다 ㅠㅠ');
			}
		}); */
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="k_questionComm">
	<hr>
	<div id="k_questionCommList">
		<c:if test="${!empty questionCommList}">

			<div id="k_questionComm" style="padding:0px">
				<c:forEach var="list" items="${questionCommList}">
					<p style="height: 20px">
						${list.qc_content} &nbsp;&nbsp; <a href="#">${list.user_name}</a>
						&nbsp;&nbsp; ${list.qc_regdate}
					</p>
					<hr>
				</c:forEach>

			</div>

		</c:if>
	</div>
	<a onclick="commentForm()" id="k_insertQCommA" class="badge badge-info">댓글달기</a>

	<div class="input-group mb-3" id="k_qCommentForm"
		style="visibility: hidden">
		<input type="text" class="form-control" id="k_inputQuesComm"
			placeholder="댓글 입력" aria-label="댓글 입력" onclick="k_loginCheck()"
			aria-describedby="basic-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary" type="button"
				id="k_insQuesCommBtn" onclick="insertQuestionComm()">입력</button>
		</div>
	</div>
</div>
<script>
	function commentForm() {
		$('#k_qCommentForm').css('visibility', 'visible');
		$('#k_insertQCommA').css('display', 'none');
	}
	function k_loginCheck() {
		var user_no = '${loginInfo.user_no}';
		if (user_no == '') {
			alert('로그인이 필요한 영역입니다.');
			$('#k_inputQuesComm').prop('disabled', 'fase');
			$('#k_insQuesCommBtn').prop('disabled', 'fase');
		}
	}
	function insertQuestionComm() {
		//질문번호,댓글 작성자 번호,질문내용 가져오기
		var qno = '${questionInfo.q_no}' * 1;
		var userNo = '${loginInfo.user_no}' * 1;
		var content = $('#k_inputQuesComm').val();

		if (content == '') {
			alert('공백은 허용하지 않습니다.');
			$('#k_inputQuesComm').prop('disabled', 'fase');
			$('#k_insQuesCommBtn').prop('disabled', 'fase');
		} else {
			$('#k_questionCommList').html('');
			$
					.ajax({
						url : '${pageContext.request.contextPath}/questionComm/insertComment',
						type : 'POST',
						data : {
							"q_no" : qno,
							"user_no" : userNo,
							"qc_content" : content
						},
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'json',
						async : false,
						success : function(data) {
							var quesCommList = '';
							$.each(data, function(index, item) {
								quesCommList += '<div class="k_questionComm" style="height: 20px">';
								quesCommList += '<p>' + item.qc_content
										+ '&nbsp;&nbsp;';
								quesCommList += '<a href="#">' + item.user_name
										+ '</a>&nbsp;&nbsp;';
								quesCommList += item.qc_regdate + '</p></div><hr>';
							});//end each

							$('#k_questionCommList').html(quesCommList);
							$('#k_inputQuesComm').val('');
						},
						error : function() {
							alert('불행하게도 에러입니다 ㅠㅠ');
						}
					}); 
		}

	}
</script>
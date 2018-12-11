<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

	<hr>
	<div id="k_questionCommList">
		

			<div id="k_questionComm" style="padding:0px">
				<c:forEach var="list" items="${questionCommList}" begin="0" end="${fn:length(questionCommList)}" varStatus="status">
					<input type="hidden" id="k_qcNo_<c:out value="${status.index}"/>" value="${list.qc_no}"/>
					<span id="k_qcContent_<c:out value="${status.index}"/>">
						${list.qc_content}
					</span>
						<input type="text" class="form-control" id="k_qcContentInput_<c:out value="${status.index}"/>" value="${list.qc_content}" style="display:none"/>
					<span id="k_qcUserName_<c:out value="${status.index}"/>"> 
						<span onclick="moveUserpage(this)"class="k_userpage" id="k_userPage_${list.user_no}">${list.user_nickname}</span>
					</span>
					<span id="k_qcRegdate_<c:out value="${status.index}"/>">
						 ${list.qc_regdate}
					</span>
					<span>
						<c:if test="${loginInfo.user_no eq list.user_no}">
							<a onclick="qc_update(this)"  class="badge badge-primary" id="k_qcUpdateBtn_<c:out value="${status.index}"/>">수정</a>
							<a onclick="qc_delete(this)"  class="badge badge-danger"  id="k_qcDeleteBtn_<c:out value="${status.index}"/>">삭제</a>
						</c:if>
					</span>
					<hr>
				</c:forEach>

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
	function qc_delete(value){
		var num = value.id.substring(14);
		//질문 댓글 고유번호
		var qcNo = $('#k_qcNo_'+num).val()*1;
		var qno = '${questionInfo.q_no}'*1;
		//로그인한 사용자 번호
		var loginUserNo = '${loginInfo.user_no}'*1;
		//댓글 창 지우기
		$('#k_questionComm').html('');
		$.ajax({
			url : '${pageContext.request.contextPath}/questionComm/deleteComm',
			type : 'GET',
			data : {
				"qc_no":qcNo,
				"q_no":qno
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			async : false,
			success : function(data){
				var quesCommList = '';
				$.each(data, function(index, item) {
					quesCommList += '<input type="hidden" id="k_qcNo_'+index+'" value="'+item.qc_no+'"/>';
					quesCommList += '<span id="k_qcContent_'+index+'">';
					quesCommList +=  item.qc_content;
					quesCommList +=  '</span>';
					quesCommList +=  '<input type="text" class="form-control" id="k_qcContentInput_'+index+'" value="'+item.qc_content+'" style="display:none"/>';
					quesCommList +=  '<span id="k_qcUserName_'+index+'">';
					quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
					quesCommList +=  '</span>';
					quesCommList +=  '<span id="k_qcRegdate_'+index+'">';
					quesCommList +=  item.qc_regdate;
					quesCommList +=  '</span>';
					if(loginUserNo == item.user_no){
						quesCommList +=  '<span>';
						quesCommList += '<a onclick="qc_update(this)"  class="badge badge-primary" id="k_qcUpdateBtn_'+index+'">수정</a>';
						quesCommList += '<a onclick="qc_delete(this)"  class="badge badge-danger" id="k_qcDeleteBtn_'+index+'">삭제</a>';
						quesCommList +=  '</span>';
					}
					quesCommList += '<hr>';
				});//end each

				$('#k_questionComm').html(quesCommList);
			},
			error:function(){
				alert('불행하게도 에러네요 ㅠㅠ');
			}
		});//end ajax
	}//end function
	
	function qc_update(value){
		var num = value.id.substring(14);
		//질문 댓글 고유번호, 댓글내용
		var qcNo = $('#k_qcNo_'+num).val()*1;
		var content = $('#k_qcContentInput_'+num).val();
		//로그인한 사용자 번호
		var loginUserNo = '${loginInfo.user_no}'*1;
		
		if(value.text == '수정'){
			$('#k_qcContent_'+num).css('display','none');
			$('#k_qcContentInput_'+num).css('display','inline-block');
			$('#k_qcUpdateBtn_'+num).text('수정완료');
		}else{
			if(content == ''){
				alert('공백으로는 수정할 수 없습니다.');
			}else{
				$('#k_questionComm').html('');
				$.ajax({
					url : '${pageContext.request.contextPath}/questionComm/updateComm',
					type : 'POST',
					data : {
						"qc_no" : qcNo,
						"qc_content" : content
					},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
					async : false,
					success : function(data){
						var quesCommList = '';
						$.each(data, function(index, item) {
							quesCommList += '<input type="hidden" id="k_qcNo_'+index+'" value="'+item.qc_no+'"/>';
							quesCommList += '<span id="k_qcContent_'+index+'">';
							quesCommList +=  item.qc_content;
							quesCommList +=  '</span>';
							quesCommList +=  '<input type="text" class="form-control" id="k_qcContentInput_'+index+'" value="'+item.qc_content+'" style="display:none"/>';
							quesCommList +=  '<span id="k_qcUserName_'+index+'">';
							quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
							quesCommList +=  '</span>';
							quesCommList +=  '<span id="k_qcRegdate_'+index+'">';
							quesCommList +=  item.qc_regdate;
							quesCommList +=  '</span>';
							if(loginUserNo == item.user_no){
								quesCommList +=  '<span>';
								quesCommList += '<a onclick="qc_update(this)"  class="badge badge-primary" id="k_qcUpdateBtn_'+index+'">수정</a>';
								quesCommList += '<a onclick="qc_delete(this)"  class="badge badge-danger" id="k_qcDeleteBtn_'+index+'">삭제</a>';
								quesCommList +=  '</span>';
							}
							quesCommList += '<hr>';
						});//end each

						$('#k_questionComm').html(quesCommList);
					},
					error : function(){
						alert('불행하게도 에러 입니다 ㅠㅠ');
					}
				});//end ajax
			} 
		}
	}//function qc_update()
	
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
		//로그인한 사용자 번호
		var loginUserNo = '${loginInfo.user_no}'*1;

		if (content == '') {
			alert('공백은 허용하지 않습니다.');
			$('#k_insQuesCommBtn').prop('disabled', 'fase');
		} else {
			$('#k_questionComm').html('');
			$.ajax({
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
								quesCommList += '<input type="hidden" id="k_qcNo_'+index+'" value="'+item.qc_no+'"/>';
								quesCommList += '<span id="k_qcContent_'+index+'">';
								quesCommList +=  item.qc_content;
								quesCommList +=  '</span>';
								quesCommList +=  '<input type="text" class="form-control" id="k_qcContentInput_'+index+'" value="'+item.qc_content+'" style="display:none"/>';
								quesCommList +=  '<span id="k_qcUserName_'+index+'">';
								quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
								quesCommList +=  '</span>';
								quesCommList +=  '<span id="k_qcRegdate_'+index+'">';
								quesCommList +=  item.qc_regdate;
								quesCommList +=  '</span>';
								if(loginUserNo == item.user_no){
									quesCommList +=  '<span>';
									quesCommList += '<a onclick="qc_update(this)"  class="badge badge-primary" id="k_qcUpdateBtn_'+index+'">수정</a>';
									quesCommList += '<a onclick="qc_delete(this)"  class="badge badge-danger"  id="k_qcDeleteBtn_'+index+'">삭제</a>';
									quesCommList +=  '</span>';
								}
								quesCommList += '<hr>';
							});//end each

							$('#k_questionComm').html(quesCommList);
							$('#k_inputQuesComm').val('');
						},
						error : function() {
							alert('불행하게도 에러입니다 ㅠㅠ');
						}
					}); 
		}

	}//end function
</script>
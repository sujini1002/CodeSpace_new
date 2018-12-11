<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<hr>
<div id="k_answerCommList_<c:out value="${num.index}"/>">
	
	<div id="k_AnswerComm_<c:out value="${item.a_no}"/>"
		style="padding: 0px">
		<c:forEach var="list" items="${answerCommentList}" begin="0"
			end="${fn:length(answerCommentList)}" varStatus="acNum">
			
			<c:if test="${list.a_no eq item.a_no }">
				<input type="hidden"
					id="k_acNo_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>"
					value="${list.ac_no}" />
				<span
					id="k_acContent_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>">
					${list.ac_content} </span>
				<input type="text" class="form-control"
					id="k_acContentInput_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>"
					value="${list.ac_content}" style="display: none" />
				<span
					id="k_acUserName_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>">
					<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_${list.user_no}">${list.user_nickname}</span>
				</span>
				<span
					id="k_acRegdate_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>">
					${list.ac_regdate} </span>
				<span>
					 <c:if test="${loginInfo.user_no eq list.user_no}">
						<a onclick="ac_update(this)" class="badge badge-primary"
							id="k_acUpdateBtn_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>">수정</a>
						<a onclick="ac_delete(this)" class="badge badge-danger"
							id="k_acDeleteBtn_<c:out value="${list.a_no}"/><c:out value="${acNum.index}"/>">삭제</a>
					</c:if>
				</span>
				<hr>
			</c:if>
		</c:forEach>
	</div>


	<a onclick="AnswercommentForm(this)"
		id="k_insertACommA_<c:out value="${num.index}"/>"
		class="badge badge-info">댓글달기</a>

	<div class="input-group mb-3"
		id="k_aCommentForm_<c:out value="${num.index}"/>"
		style="visibility: hidden">
		<input type="text" class="form-control"
			id="k_inputAnswComm_<c:out value="${num.index}"/>"
			placeholder="댓글 입력" aria-label="댓글 입력" onclick="k_AloginCheck(this)"
			aria-describedby="basic-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary" type="button"
				id="k_insAnswCommBtn_<c:out value="${num.index}"/>"
				onclick="insertAnswerComm(this)">입력</button>
		</div>
	</div>
</div>
<script>
	function ac_delete(value){
		var num = value.id.substring(value.id.lastIndexOf('_')+1);
		//답변 댓글 고유 번호 , 답변 번호 가져오기
		var acNo = $('#k_acNo_'+num).val()*1;
		//로그인한 사용자 번호
		var loginUserNo = '${loginInfo.user_no}'*1;
		//답변 번호
		var ano=0;
		//답변 댓글 삭제
		$.ajax({
					url : '${pageContext.request.contextPath}/answerComm/deleteComment',
					type : 'GET',
					data : {
						"ac_no" : acNo
					},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
					async : false,
					success : function(data) {
						var quesCommList = '';
							$.each(data, function(index, item) {
								if(item.ac_no==0){
									ano = item.a_no;	
								}else{
									quesCommList += '<input type="hidden" id="k_acNo_'+item.a_no+index+'" value="'+item.ac_no+'"/>';
									quesCommList += '<span id="k_acContent_'+item.a_no+index+'">';
									quesCommList +=  item.ac_content;
									quesCommList +=  '</span>';
									quesCommList +=  '<input type="text" class="form-control" id="k_acContentInput_'+item.a_no+index+'" value="'+item.ac_content+'" style="display:none"/>';
									quesCommList +=  '<span id="k_acUserName_'+item.a_no+index+'">';
									quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
									quesCommList +=  '</span>';
									quesCommList +=  '<span id="k_acRegdate_'+item.a_no+index+'">';
									quesCommList +=  item.ac_regdate;
									quesCommList +=  '</span>';
									if(loginUserNo == item.user_no){
										quesCommList +=  '<span>';
										quesCommList += '<a onclick="ac_update(this)"  class="badge badge-primary" id="k_acUpdateBtn_'+item.a_no+index+'">수정</a>';
										quesCommList += '<a onclick="ac_delete(this)"  class="badge badge-danger"  id="k_acDeleteBtn_'+item.a_no+index+'">삭제</a>';
										quesCommList +=  '</span>';
								}
									quesCommList += '<hr>';
									ano = item.a_no;	
								}
								
							});//end each
							
							$('#k_AnswerComm_'+ano).html(quesCommList);
					},
					error : function() {
						alert('불행하게도 에러입니다 ㅠㅠ');
					}
				});//end ajax 
	}
	function ac_update(value){
		var num = value.id.substring(value.id.lastIndexOf('_')+1);
		//답변 댓글 고유 번호 , 답글 내용 가져오기
		var acNo = $('#k_acNo_'+num).val()*1;
		var content = $('#k_acContentInput_'+num).val();
		//로그인한 사용자 번호
		var loginUserNo = '${loginInfo.user_no}'*1;
		
		if(value.text == '수정'){
			$('#k_acContent_'+num).css('display','none');
			$('#k_acContentInput_'+num).css('display','inline-block');
			$('#k_acUpdateBtn_'+num).text('수정완료');
		}else{
			if(content == ''){
				alert('공백으로는 수정 불가능 합니다.');
			}else{
				$('#k_AnswerComm_'+num).html('');
				var ano=0;
				$.ajax({
							url : '${pageContext.request.contextPath}/answerComm/updateComment',
							type : 'POST',
							data : {
								"ac_no" : acNo,
								"ac_content" : content,
							},
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							dataType : 'json',
							async : false,
							success : function(data) {
								var quesCommList = '';
								$.each(data, function(index, item) {
									quesCommList += '<input type="hidden" id="k_acNo_'+item.a_no+index+'" value="'+item.ac_no+'"/>';
									quesCommList += '<span id="k_acContent_'+item.a_no+index+'">';
									quesCommList +=  item.ac_content;
									quesCommList +=  '</span>';
									quesCommList +=  '<input type="text" class="form-control" id="k_acContentInput_'+item.a_no+index+'" value="'+item.ac_content+'" style="display:none"/>';
									quesCommList +=  '<span id="k_acUserName_'+item.a_no+index+'">';
									quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
									quesCommList +=  '</span>';
									quesCommList +=  '<span id="k_acRegdate_'+item.a_no+index+'">';
									quesCommList +=  item.ac_regdate;
									quesCommList +=  '</span>';
									if(loginUserNo == item.user_no){
										quesCommList +=  '<span>';
										quesCommList += '<a onclick="ac_update(this)"  class="badge badge-primary" id="k_acUpdateBtn_'+item.a_no+index+'">수정</a>';
										quesCommList += '<a onclick="ac_delete(this)"  class="badge badge-danger"  id="k_acDeleteBtn_'+item.a_no+index+'">삭제</a>';
										quesCommList +=  '</span>';
									}
									quesCommList += '<hr>';
									ano = item.a_no;
								});//end each
								
								$('#k_AnswerComm_'+ano).html(quesCommList);
							},
							error : function() {
								alert('불행하게도 에러입니다 ㅠㅠ');
							}
						});//end ajax 
			}//end if(content == '')
		}//end if(value.text == '수정')
	}
	function AnswercommentForm(value) {
		
		var num = value.id.substring(value.id.lastIndexOf('_')+1);
		
		$('#k_aCommentForm_'+num).css('visibility', 'visible');
		$('#k_insertACommA_'+num).css('display', 'none');
	}
	function k_AloginCheck(value) {
		
		var num = value.id.substring(value.id.lastIndexOf('_')+1);
		var user_no = '${loginInfo.user_no}';
		
		if (user_no == '') {
			alert('로그인이 필요한 영역입니다.');
			$('#k_inputAnswComm_'+num).prop('disabled', 'fase');
			$('#k_insAnswCommBtn_'+num).prop('disabled', 'fase');
		}
	}
	function insertAnswerComm(value){
		var num = value.id.substring(value.id.lastIndexOf('_')+1);
		//답변번호,댓글 작성자 번호,질문내용 가져오기
		var ano = $('#k_aNo_'+num).val() * 1;
		var userNo = '${loginInfo.user_no}' * 1;
		var content = $('#k_inputAnswComm_'+num).val();

		if (content == '') {
			alert('공백은 허용하지 않습니다.');
			$('#k_insAnswCommBtn_'+num).prop('disabled', 'fase');
		} else {
			$('#k_AnswerComm_'+num).html('');
			var a_no=0;
			$.ajax({
						url : '${pageContext.request.contextPath}/answerComm/insertComment',
						type : 'POST',
						data : {
							"a_no" : ano,
							"user_no" : userNo,
							"ac_content" : content
						},
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'json',
						async : false,
						success : function(data) {
							
							var quesCommList = '';
							$.each(data, function(index, item) {
								quesCommList += '<input type="hidden" id="k_acNo_'+ano+index+'" value="'+item.ac_no+'"/>';
								quesCommList += '<span id="k_acContent_'+ano+index+'">';
								quesCommList +=  item.ac_content;
								quesCommList +=  '</span>';
								quesCommList +=  '<input type="text" class="form-control" id="k_acContentInput_'+ano+index+'" value="'+item.ac_content+'" style="display:none"/>';
								quesCommList +=  '<span id="k_acUserName_'+ano+index+'">';
								quesCommList +=  '<span onclick="moveUserpage(this)" class="k_userpage" id="k_userPage_'+item.user_no+'">'+item.user_nickname+'</span>';
								quesCommList +=  '</span>';
								quesCommList +=  '<span id="k_acRegdate_'+ano+index+'">';
								quesCommList +=  item.ac_regdate;
								quesCommList +=  '</span>';
								if(userNo == item.user_no){
									quesCommList +=  '<span>';
									quesCommList += '<a onclick="ac_update(this)"  class="badge badge-primary" id="k_acUpdateBtn_'+ano+index+'">수정</a>';
									quesCommList += '<a onclick="ac_delete(this)"  class="badge badge-danger"  id="k_acDeleteBtn_'+ano+index+'">삭제</a>';
									quesCommList +=  '</span>';
								}
								quesCommList += '<hr>';
								a_no = item.a_no;
							});//end each

							$('#k_AnswerComm_'+a_no).html(quesCommList);
							$('#k_inputAnswComm_'+num).val('');
						},
						error : function() {
							alert('불행하게도 에러입니다 ㅠㅠ');
						}
					}); 
		}//end if(content='') 
	}//end function
</script>
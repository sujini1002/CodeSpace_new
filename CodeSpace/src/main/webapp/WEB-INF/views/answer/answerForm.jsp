<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<table style="width: 100%; margin-top: 80px">
	<!-- 답변시작 -->
	<tr>
		<td colspan="2">
			<!-- 답변 갯수 -->
			<div class="k_AnswerCnt">
				<b> ${fn:length(answerList)} 답변들</b>
			</div>
			<!-- 정렬 순 -->
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link active k_color" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=score">활동순</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=votes">추천순</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=date">최신순</a></li>
				</ul>
		</td>
	</tr>
	<c:forEach var="item" items="${answerList}" begin="0" end="${fn:length(answerList)}" varStatus="num">
	<tr>
	
		<!-- 답변 추천 -->
		<td rowspan="4" style="width:15%;text-align:center">
			<div id="k_Arecommand">
				<button type="button" class="btn" style="background-color: #ecf0f5">
					<i class="fa fa-chevron-up fa-2x" style="color: gray;"></i>
				</button>
				<h3>${item.a_recommand}</h3>
				<button type="button" class="btn" style="background-color: #ecf0f5">
					<i class="fa fa-chevron-down fa-2x" style="color: gray;"></i>
				</button>
			</div>
			<!-- 답변 채택  -->
			<div id="k_Choose" style="margin-top: 10px">
				<button type="button" class="btn" style="background-color:#ecf0f5">
					<i class="fas fa-check fa-2x" style="color:gray"></i>
				</button>
			</div>
		</td>
		<!-- 답변 내용 -->
		<td style="width:85%;" id="k_td_<c:out value="${num.index}"/>">
			<div id="editor_<c:out value="${num.index}"/>">
			 <textarea rows="50" cols="50" id="k_answerText_<c:out value="${num.index}"/>" class="k_answerTexts"
					style="display: none">
				${item.a_content}
			</textarea>
			</div>
		</td>
	</tr>
	<tr>
		<td style="height: 70px">
		<hr>
		<c:if test="${!item.a_tag.isEmpty()}">
			<button type="button" class="btn k_qtagBtn btn-sm k_atagBtn_<c:out value="${num.index}"/>">${item.a_tag}</button>
		</c:if>
		<input type="text" class="form-control" id="k_atag_<c:out value="${num.index}"/>"  value="${item.a_tag}" placeholder="태그를 입력하세요" style="display:none"  />
		</td>
		<input type="hidden" id="k_aNo_<c:out value="${num.index}"/>" value="${item.a_no}"/>
		<input type="hidden" id="k_qNo_<c:out value="${num.index}"/>" value="${item.q_no}"/>
	</tr>
	<tr>
		<!-- 답변 수정 / 답변 작성자 -->
		<td style="width: 85%;">
			<c:if test="${item.user_no eq loginInfo.user_no}">
				<button type="button" id="k_updateBtn_<c:out value="${num.index}"/>"
					class="btn btn-outline-info k_AnswerContentBtn k_AnswerUpdate"
					onclick="answer_update(this)">수정</button>
			</c:if>
			<!-- 답변 작성자 정보 -->
			<%@include file="answerUser.jsp"%>
		</td>
		
	</tr>
	<tr>
		<!-- 답변 댓글 -->
		<td>
			<!-- 댓글 인클루드 -->
		</td>
	</tr>
	</c:forEach>
	<!-- 답변끝 -->
</table>

<!-- 답변 작성 -->
<div id="k_insertQuestion">
 <h4>${loginInfo.user_nickname}님의 답변</h4>
 <div id="k_AnswerEditor" onclick="checkLevel()">
 	
 </div>
 <input type="text" name="a_tag"  id="a_tag" placeholder="태그를 입력해 주세요"  class="form-control" required/>
 <button type="button" id="k_saveAnswer"
	class="btn btn-outline-info">답변 등록</button>
</div>
<!-- 모달 -->
<div id="k_checkModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">삭제</h4>
      </div>
      <div class="modal-body" id="k_modalBody">
        <p>${loginInfo.user_nickname}은 입문등급이므로  답변 작성이 불가 합니다.<br>초급 부터 작성 가능 합니다</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="k_modalBtn" onclick="k_goToQuestion()">질문하러가기</button>
      </div>
    </div>

  </div>
</div>

<script>

	var length = '${fn:length(answerList)}';
	length *= 1;
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
		for(var j=0;j<length;j++){
			eval("var updateQuill"+j+"= ''");
		}
		
	$(window).load(function(){
		
		
		for(var i=0;i<=length;i++){
			
			var delta = JSON.parse($('#k_answerText_'+i).val());

			eval(
				"updateQuill"+i+" = new Quill('#editor_'+i,{modules :{toolbar : toolbarOptions},theme : 'snow'});"
			); 
			$('#k_td_'+i+'> div.ql-toolbar.ql-snow').css('display', 'none');
			$('#editor_'+i).css('border', 'none');
			eval("updateQuill"+i+".setContents(delta);");
			eval("updateQuill"+i+".enable(false);");
		}//end for i
		
	});
</script>
<script>
	function answer_update(value){
		 var num = value.id.substring(value.id.length-1);
		
			if($('#k_updateBtn_'+num).text() == '수정'){
				//quill 툴바 보이기
				$('#k_td_'+num+'> div.ql-toolbar.ql-snow').css('display', 'inline-block');
				//수정 폼 테두리 설정
				$('#editor_'+num).css('border', '1px solid lightgray');
				$('#editor_'+num).css('height', '250px');
				//수정 폼 작성 가능
				eval("updateQuill"+num+".enable(true);");
				//태그 및 제목 수정 가능
				$('.k_atagBtn_'+num).css('display', 'none');
				$('#k_atag_'+num).css('display', 'inline-block');
				$('#k_td_'+num+'> div.ql-toolbar.ql-snow').css('width', '100%');
				
				//버튼 수정 
				$('#k_updateBtn_'+num).text('수정완료');
			}else{
				//답변 고유번호,내용,태그 가져오기
				var a_no = $('#k_aNo_'+num).val();
				a_no *= 1;
				var q_no =$('#k_qNo_'+num).val();
				var content = eval("JSON.stringify(updateQuill"+num+".getContents());");
				var tag = $('#k_atag_'+num).val();
				
				$.ajax({
					url : '${pageContext.request.contextPath}/answer/updateAnswer',
					type : 'POST',
					data : {
						"a_no" : a_no,
						"a_content" : content,
						"a_tag" : tag
					},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
					success : function(data) {
						if (data.result == "1") {
							location.href = '${pageContext.request.contextPath}/question/questionView?q_no='
									+ q_no;
						} else {
							alert('수정 실패하였습니다 ㅠㅠ');
						}
					},
					error : function() {
						alert('불행하게도 에러입니다 ㅠㅠ');
					}
				});
			}
			
	}
</script>


<script>
	function checkLevel(){
		var userno = '${loginInfo.user_no}';
		var q_user = '${questionInfo.user_no}';
		
		if(userno==""){
			$('#k_modalBody').html('<p>로그인이 필요한 기능 입니다</p>');
			$('#k_modalBtn').css('display','none');
			$('#k_checkModal').modal();
			Answerquill.enable(false);
			$('#a_tag').prop("disabled",true);
			$('#k_saveAnswer').prop("disabled",true);
		}else if(userno == q_user){
			$('#k_modalBody').html('<p>질문작성한 본인은 답변을 다실 수 없습니다.</p>');
			$('#k_modalBtn').css('display','none');
			$('#k_checkModal').modal();
			Answerquill.enable(false);
			$('#a_tag').prop("disabled",true);
			$('#k_saveAnswer').prop("disabled",true);
		}else{
			 $.ajax({
				url:'${pageContext.request.contextPath}/answer/checkLevel',
				type:'GET',
				data:{
					"user_no":userno
				},
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'json',
				success:function(data){
					console.log(data);
					if(data.result == "false"){
						$('#k_checkModal').modal();
						Answerquill.enable(false);
						$('#a_tag').prop("disabled",true);
						$('#k_saveAnswer').prop("disabled",true);
					}
				},
				error:function(){
					alert('불행하게도 에러입니다 ㅠㅠ');
				}
			});
		}
	}
	function k_goToQuestion(){
		location.href='${pageContext.request.contextPath}/question/insertQuestion';
	}

</script>
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
	
	
	$('#k_saveAnswer').click(function (){
		//질문 고유 번호
		var q_no = $('#k_qNO').val();
		var userno = '${loginInfo.user_no}';
		var content = JSON.stringify(Answerquill.getContents());
		var tag = $('#a_tag').val();
		//테스트
		
	   if(content != '\{"ops":\[\{"insert":"\\n"\}\]\}'){
		  $.ajax({
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
					if(data.result=="1"){
					location.href='${pageContext.request.contextPath}/question/questionView?q_no='+q_no;
					}else{
						alert("실패하였습니다ㅠㅠ");
					}
				},
				error:function(){
					alert('불행하게도 에러입니다 ㅠㅠ');
				}
			});
		}else{
			alert('작성한 글이 없어 등록할 수 없습니다.');
		} 
	});
</script>
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
			<c:choose>
				<c:when test="${fn:length(answerList) ne 0}">
					<b> ${fn:length(answerList)} 답변들</b>
				</c:when>
				<c:otherwise>
					<b>답변이 존재 하지 않습니다.</b>
				</c:otherwise>
			</c:choose>
			</div>
			<c:if test="${fn:length(answerList) ne 0}">
			<!-- 정렬 순 -->
				<ul class="nav justify-content-end" id="k_orderBy">
					<li class="nav-item"><a class="nav-link active k_color" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=score">활동순</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=votes">추천순</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/question/questionView?q_no=${questionInfo.q_no}&order=date">최신순</a></li>
				</ul>
			</c:if>
		</td>
	</tr>
	<c:forEach var="item" items="${answerList}" begin="0" end="${fn:length(answerList)}" varStatus="num">
	<tr>
	
		<!-- 답변 추천 -->
		<td rowspan="4" style="width:15%;text-align:center">
			<div id="k_Arecommand">
					<button type="button"
						id="k_aRecommandUpBtn_<c:out value="${num.index}"/>" class="btn"
						style="background-color: #ecf0f5" onclick="k_aRecommand(this)">
						<c:set var="ucolor" value="gray"></c:set>
						 <c:forEach var = "aRecom" items="${aRecommandList}">
							 <c:if test="${aRecom.a_no eq item.a_no and aRecom.a_updown eq 1}">
						 		<c:set var="ucolor" value="#17a2b8"></c:set>
						   	</c:if>
						 </c:forEach>
							<i class="fa fa-chevron-up fa-2x" style="color: ${ucolor}"
							id="k_aRecommandUpIcon_<c:out value="${num.index}"/>"></i>
					</button>
					<h3 id="k_aRecommandCnt_<c:out value="${num.index}"/>">${item.a_recommand}</h3>
					<button type="button"
						id="k_aRecommandDownBtn_<c:out value="${num.index}"/>" class="btn"
						style="background-color: #ecf0f5" onclick="k_aRecommand(this)">
						<c:set var="dcolor" value="gray"></c:set>
						 <c:forEach var = "aRecom" items="${aRecommandList}">
							 <c:if test="${aRecom.a_no eq item.a_no and aRecom.a_updown eq 0}">
						 		<c:set var="dcolor" value="#17a2b8"></c:set>
						   	</c:if>
						 </c:forEach>
						
						<i class="fa fa-chevron-down fa-2x" style="color: ${dcolor}"
							id="k_aRecommandDownIcon_<c:out value="${num.index}"/>"></i> 
						
					</button>
				</div>
			<!-- 답변 채택  -->
			<div id="k_Choose" style="margin-top: 10px">
					<c:if test="${loginInfo.user_no eq questionInfo.user_no and aChooseNum eq 0}">
						<button type="button"
							data-id="k_ChooseBtn_<c:out value="${num.index}"/>" class="btn"
							style="background-color: #ecf0f5" data-toggle="modal"
							data-target="#k_chooseModal">
							<i class="far fa-check-circle fa-2x"
								id="k_ChooseIcon_<c:out value="${num.index}"/>"
								style="color: gray"></i>
						</button>
					</c:if>
					<c:if test="${aChooseNum eq item.a_no}">
						<button type="button"
							data-id="k_ChooseBtn_<c:out value="${num.index}"/>" class="btn"
							style="background-color: #ecf0f5" data-toggle="modal"
							data-target="#k_chooseModal" disabled>
							<i class="far fa-check-circle fa-2x"
								id="k_ChooseIcon_<c:out value="${num.index}"/>"
								style="color: #17a2b8"></i>
						</button>
					</c:if>
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
		<td style="height: 70px" id="k_aTagsView_<c:out value="${num.index}"/>">
		<hr>
		<div class="k_aTag" id="k_aTag_<c:out value="${num.index}"/>">
			<ul class="k_aTagUl" id="k_aTagUl_<c:out value="${num.index}"/>">
			
			</ul>
		</div>
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
			<%@include file="answerComment.jsp" %>
		</td>
	</tr>
	</c:forEach>
	<!-- 답변끝 -->
</table>

<!-- 답변 작성 -->
<div id="k_insertQuestion">
 <c:if test="${loginInfo.user_no ne null }">
 	<h4>${loginInfo.user_nickname}님의 답변</h4>
 </c:if>
 <div id="k_AnswerEditor" onclick="checkLevel()">
 	
 </div>
<ul id="k_atags" onclick="checkLevel()"></ul>
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
      <div class="modal-footer" id="k_modalFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="k_modalBtn" onclick="k_goToQuestion()">질문하러가기</button>
      </div>
    </div>

  </div>
</div>

<!-- 채택 모달  -->
<!-- Modal -->
<div id="k_chooseModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">답변 채택하기</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="k_chooseModalContent">
        <p>지금 채택 하시면 다른 답변들은 채택 하실 수 없습니다. <br> 정말 채택하시겠습니까?</p>
      </div>
      <div class="modal-footer">
      	<button type="button" id="k_chooseBtn_final" class="btn btn-outline-info" onclick="k_ChooseAnswer(this)">채택하기</button>
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- 채택 성공 모달 -->
<div id="k_chooseSuccessModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">답변 채택하기 성공</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="k_chooseModalContent">
        <p>채택되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script type="text/javascript">
	 $(document).ready(function() {
	        $("#k_atags").tagit();
	        var length = '${fn:length(answerList)}'*1;
	        
	        <c:forEach items="${answerList}" var="item" begin="0" end="${fn:length(answerList)}" varStatus="tag">
			var tags = '${item.a_tag}';
			var tagArr = tags.split("/");
			
			for(var i =0 ;i<tagArr.length;i++){
				if(tagArr[i]!= ''){
					$('#k_aTag_'+<c:out value="${tag.index}"/>).append('<button type="button" class="btn k_atagBtn k_atagBtn_'+<c:out value="${tag.index}"/>+'" onclick="searchTag(this)" id="k_atagBtnId_'+<c:out value="${tag.index}"/>+i+'">'+tagArr[i]+'</button>');
					$('#k_aTagUl_'+<c:out value="${tag.index}"/>).append('<li>'+tagArr[i]+'</li>');
				}
			}
			</c:forEach>
			
	    });
	 function searchTag(value){
		 var tag = $('#'+value.id).text();
		 location.href="${pageContext.request.contextPath}/search/tagged?tag="+tag;
	 }
</script>

<script>

	$('#k_chooseModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
	  var button = $(event.relatedTarget); // 모달 윈도우를 오픈하는 버튼
	  var id = button.data('id'); // 버튼에서 data-title 값을 titleTxt 변수에 저장
	  var modal = $(this);
	  modal.find('#k_chooseBtn_final').val(id); // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
	});
	//답변 채택
	function k_ChooseAnswer(value){
		var num = value.value.substring(value.value.lastIndexOf('_')+1);
		var ano = $('#k_aNo_'+num).val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/answer/answerChoose',
			type : 'GET',
			data : { "a_no" : ano},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success : function(data){
				if(data.message == '1'){
					$('#k_chooseModal').modal('hide');
					$('#k_chooseSuccessModal').modal();
					$('#k_ChooseIcon_'+num).css('color','#17a2b8');
					$('#k_ChooseBtn_'+num).prop('disabled',true);
					$('#k_chooseModalContent').html('<p>이미 채택되었습니다.</p>');
					$('#k_chooseBtn_final').css('display','none');
				}
			},
			error : function(){
				
				alert('불행하게도 에러 입니다ㅠㅠ');
			}
		});
						
	}
	//추천 비추천 처리  
	function k_aRecommand(value){
		//추천 누른 답변의 번호 추출 하기위한 변수
		var num = value.id.substring(value.id.lastIndexOf('_')+1)*1;
		//추천or비추천인지 알기 위한 변수
		var id = value.id.substring(0,value.id.lastIndexOf('_'));
		//로그인한 사용자 정보
		var userNo = '${loginInfo.user_no}'*1;
		//로그인 체크
		if(userNo == 0){
			alert('추천 하려면 로그인이 필요합니다.');
			return
		}else{
			//답변 고유 번호,추천 누른 사용자 번호, 추전/비추천 점수 전달
			var ano = $('#k_aNo_'+num).val()*1;
			var score = id=='k_aRecommandUpBtn'?1:0;
			
			//추천 / 비추천 적용하기
			$.ajax({
				url : '${pageContext.request.contextPath}/answer/answerRecommand',
				type : 'POST',
				data : {
					"a_no" : ano,
					"user_no" : userNo,
					"a_updown" : score,
				},
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'json',
				success : function(data){
					$('#k_aRecommandCnt_'+num).text(data.a_recommand);
					if(data.status==0){
						$('#k_aRecommandUpIcon_'+num).css('color','gray');
						$('#k_aRecommandDownIcon_'+num).css('color','gray');
					}else{
						if(score == 1){
							$('#k_aRecommandUpIcon_'+num).css('color','#17a2b8');
						}else{
							$('#k_aRecommandDownIcon_'+num).css('color','#17a2b8');
						}
					}
				},
				error : function(){
					alert('불행하게도 에러네요');
				}
			});//end ajax
		}//end else
		
	}//end function
</script>
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
				"updateQuill"+i+" = new Quill('#editor_"+i+"',{modules :{toolbar : toolbarOptions},theme : 'snow'});"
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
				$('#editor_'+num).css('background-color', 'white');
				//수정 폼 작성 가능
				eval("updateQuill"+num+".enable(true);");
				//태그 및 제목 수정 가능
				$('.k_atagBtn_'+num).css('display', 'none');
				$('#k_aTagUl_'+num).css('visibility','visible');
				$('#k_aTagUl_'+num).css('background-color','white');
				$('#k_aTagUl_'+num).tagit();
				$('#k_td_'+num+'> div.ql-toolbar.ql-snow').css('width', '100%');
				
				//버튼 수정 
				$('#k_updateBtn_'+num).text('수정완료');
			}else{
				//답변 고유번호,내용,태그 가져오기
				var a_no = $('#k_aNo_'+num).val()*1;
				var q_no =$('#k_qNo_'+num).val();
				var content = eval("JSON.stringify(updateQuill"+num+".getContents());");
				var tag = '';
				$('#k_aTagUl_'+num+'>li>input[name="tags"]').each(function(i){
					 tag += $('#k_aTagUl_'+num+'>li>input[name="tags"]').eq(i).attr('value');
					if(i!= $('#k_aTagUl_'+num+'>li>input[name="tags"]').length-1){
						tag += '/';
					}
					
				});
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
							window.location.reload();
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
		//답변자와 로그인 한자의 일치 여부
		var size = $('.k_answerUsers').length;
		var cnt = 0;
		
		for(var i =0;i<size;i++){
			var no = $('.k_answerUsers').eq(i).attr('value');
			if(userno == no){ cnt++;}	
		}
		
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
		}else if(cnt > 0){
			$('#k_modalBody').html('<p>답변은 한번만 다실 수 있습니다.</p>');
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
		var tag = '';
		$('input[name="tags"]').each(function(i){
			tag += $('input[name="tags"]').eq(i).attr('value');
			if(i!= $('input[name="tags"]').length-1){
				tag += '/';
			}
		});
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
						window.location.reload();
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
	//주석
</script>

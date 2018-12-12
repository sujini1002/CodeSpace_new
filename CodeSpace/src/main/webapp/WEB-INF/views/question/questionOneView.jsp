<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<table style="width: 100%" class="k_table">

		<!-- 타이틀 -->
		<tr>
			<td colspan="2" style="text-align: center"><input type="hidden"
				id="k_qNO" value="${questionInfo.q_no}" />
				<h3 id="k_qTitle">${questionInfo.q_title}</h3> <input type="text"
				class="form-control" id="k_qtitleForm"
				value="${questionInfo.q_title}" />
				<hr></td>
		</tr>
		<!-- 태그 -->
		<tr>
			<td></td>
			<td style="height: 70px;" id="k_qTag">
				<ul id="k_qTagUl">

				</ul>
				<hr>
			</td>

		</tr>
		<tr>
			<!-- 추천 & 즐겨 찾기 -->
			<td rowspan="3" style="width: 15%; text-align: center;">
				<div id="k_recommand">
					<button type="button" id="k_qRecommandUpBtn" class="btn"
						style="background-color: #ecf0f5" onclick="k_qRecommand(this)">
						<c:choose>
							<c:when test="${qRecommand eq 1 }">
								<i class="fa fa-chevron-up fa-2x" style="color: #17a2b8;"
									id="k_qRecommandUpIcon"></i>
							</c:when>
							<c:otherwise>
								<i class="fa fa-chevron-up fa-2x" style="color: gray;"
									id="k_qRecommandUpIcon"></i>
							</c:otherwise>
						</c:choose>
					</button>
					<h3 id="k_qRecommandCnt">${questionInfo.q_recommand}</h3>
					<button type="button" class="btn" id="k_qRecommandDownBtn"
						style="background-color: #ecf0f5" onclick="k_qRecommand(this)">
						<c:choose>
							<c:when test="${qRecommand eq 0 }">
								<i class="fa fa-chevron-down fa-2x" style="color: #17a2b8;"
									id="k_qRecommandDownIcon"></i>
							</c:when>
							<c:otherwise>
								<i class="fa fa-chevron-down fa-2x" style="color: gray;"
									id="k_qRecommandDownIcon"></i>
							</c:otherwise>
						</c:choose>
					</button>
				</div>
				<div id="k_bookmark" style="margin-top: 10px">
					<button type="button" class="btn" id="k_bookmarkBtn"
						onclick="k_bookmark()" style="background-color: #ecf0f5">
						<c:if test="${bookmark ne 0 }">
							<i class="fa fa-star fa-2x" id="k_bookmarkIcon"
								style="color: orange;"></i>
						</c:if>
						<c:if test="${bookmark eq 0 }">
							<i class="fa fa-star fa-2x" id="k_bookmarkIcon"
								style="color: gray;"></i>
						</c:if>
					</button>
				</div>
			</td>

			<!-- 질문내용 -->
			<td>
				<div id="toolbar"></div>
				<div id="editor">
					<textarea rows="50" cols="50" id="k_questionText"
						style="display: none">
					${questionInfo.q_content}
				</textarea>

				</div>
				<div id="k_regdate" style="float: right">
					<p>${questionInfo.q_regdate}</p>
				</div>


			</td>
		</tr>
		<tr>
			<!-- 작성자 -->
			<td style="width: 85%"><c:if
					test="${loginInfo.user_no eq userInfo.user_no}">
					<button type="button" id="k_questionUpdate"
						class="btn btn-primary k_questionContentBtn"
						onclick="k_qeustionupdate()">수정</button>
					<button type="button" id="k_questionDelete"
						class="btn btn-danger k_questionContentBtn" data-toggle="modal"
						data-target="#myModal">삭제</button>

				</c:if> <%@include file="questionUser.jsp" %></td>
		</tr>
		
		<tr>
			<!-- 댓글 -->
			<td style="width: 85%"><%@include file="questionComment.jsp"%>
			</td>
		</tr>
	</table>
	<!-- 모달 -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">답변등록불가</h4>
				</div>
				<div class="modal-body">
					<p>
						정말 삭제 하시겠습니까??<br>삭제 하면 다시 복구 되지 않습니다.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger"
						onclick="k_questiondelete()">삭제</button>
				</div>
			</div>

		</div>
	</div>
	<!-- 로드시 태그 가져오기 -->
	<script>
	$(document).ready(function(){
		var tags = '${questionInfo.q_tag}';
		var tagArr = tags.split("/");
		
		for(var i =0 ;i<tagArr.length;i++){
			if(tagArr[i]!= ''){
				$('#k_qTag').append('<button type="button" onclick="moveTag(this.value)" value="'+ tagArr[i] +'" class="btn k_qtagBtn" id="k_qtagBtnId_'+i+'">'+tagArr[i]+'</button>');
				$('#k_qTagUl').append('<li>'+tagArr[i]+'</li>');
			}
		}
	});
	
	<!-- 태그 클릭 시 태그 검색 페이지로 이동-->
	function moveTag(tag){
		
		location.href="${pageContext.request.contextPath}/search/tagged?tag="+tag;
	}
	
</script>
	<!-- 북마크 -->
	<script>
	function k_bookmark(){
		var qno = '${questionInfo.q_no}'*1;
		var userNo = '${loginInfo.user_no}'*1;
		$.ajax({
			url : '${pageContext.request.contextPath}/question/bookmark',
			type : 'POST',
			data : {
				"q_no" : qno,
				"user_no" : userNo
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success : function(data){
				if(data.message == 'insert'){
					$('#k_bookmarkIcon').css('color','orange');
				}else{
					$('#k_bookmarkIcon').css('color','gray');
				}
			},
			error : function(){
				alert('불행하게도 에러 입다');
			}
		});//end ajax
	}//end k_bookmark()
</script>
	<!-- 추천 관련 스크립트  -->
	<script>
	function k_qRecommand(value){
		
		var userNo = '${loginInfo.user_no}'*1;
		if(userNo==0){
			alert('추천 하려면 로그인 해야 합니다.');
			return
		}else{
			//질문 고유 번호 , 추천 누르는 사용자 번호 , 추천 이므로 +1 보내기
			var qno = '${questionInfo.q_no}'*1;
			var score = value.id=='k_qRecommandUpBtn'?1:-1;
			var status = 0;
			
			if(document.querySelectorAll('#k_qRecommandUpIcon')[0].style.color=='rgb(23, 162, 184)'){
				status = -1;
			}else if(document.querySelectorAll('#k_qRecommandDownIcon')[0].style.color=='rgb(23, 162, 184)'){
				status = 1;
			}
			
			
			 $.ajax({
				url: '${pageContext.request.contextPath}/question/questionRecommand',
				type: 'POST',
				data :{
					"q_no" : qno,
					"user_no" : userNo,
					"score" : score,
					"status" : status
				},
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'json',
				success : function(data){
					$('#k_qRecommandCnt').text(data.q_recommand);
					if(data.q_isrecommand==1){
						$('#k_qRecommandUpIcon').css('color','gray');
						$('#k_qRecommandDownIcon').css('color','gray');
					}else{
						if(score == 1){
							$('#k_qRecommandUpIcon').css('color','#17a2b8');
						}else{
							$('#k_qRecommandDownIcon').css('color','#17a2b8');
						}
					}
				},
				error : function(){
					alert('불하게도 에러네요');
				}
			});//end ajax 
		}
		
		
	}
	
	function k_recoLogin(){
		var userNo = '${loginInfo.user_no}';
		if(userNo == ''){
			alert('로그인이 필요한 영역 입니다.');
			$('#k_qRecommandUpBtn').prop('disabled','true');
			$('#k_qRecommandDownBtn').prop('disabled','true');
		}
	}
	
</script>

	<script>
	function k_qeustionupdate() {

		//var now = $('#k_questionUpdate').val();
		if ($('#k_questionUpdate').text() == "수정") {
			//quill 툴바 보이기
			$('.ql-toolbar').css('visibility', 'visible');
			//수정 폼 테두리 설정
			$('#editor').css('border', '1px solid lightgray');
			$('#editor').css('background-color','white');
			//수정 폼 작성 가능
			Questionquill.enable(true);
			//태그 및 제목 수정 가능
			$('#k_qTitle').css('display', 'none');
			$('.k_qtagBtn').css('display', 'none');
			$("#k_qTagUl").css('visibility','visible');
			$('#k_qTagUl').css('background-color','white');
			$("#k_qTagUl").tagit();
			$('#k_qtitleForm').css('display', 'inline-block');
			//삭제 버튼 숨기기
			$('#k_questionDelete').css('visibility', 'hidden');
			//버튼 수정 
			$('#k_questionUpdate').text('수정완료');
		} else {

			var qno = $('#k_qNO').val();
			qno *= 1;
			var title = $('#k_qtitleForm').val();
			var content = JSON.stringify(Questionquill.getContents());
			var tag = '';
			$('input[name="tags"]').each(function(i){
				tag += $('input[name="tags"]').eq(i).attr('value');
				if(i!= $('input[name="tags"]').length-1){
					tag += '/';
				}
			});

			$.ajax({
						url : '${pageContext.request.contextPath}/question/updateQuestion',
						type : 'POST',
						data : {
							"q_no" : qno,
							"q_title" : title,
							"q_content" : content,
							"q_tag" : tag
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
					}); //end ajax;
		}//end else

	}
	function k_questiondelete(){
		
		//질문 고유 번호
		var qno = $('#k_qNO').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/question/deleteQuestion',
			type : 'GET',
			data : {
				"q_no" : qno
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success : function(data) {
				if(data.result == "1"){
					alert('삭제하였습니다.');
					location.href="${pageContext.request.contextPath}";
				}else{
					alert('답변이 존재하므로 삭제할 수 없습니다.');
					window.location.reload();
				}
			},
			error : function() {
				alert('불행하게도 에러입니다 ㅠㅠ');
				
			}
		});//end ajax;
	}//end k_questiondelete()
</script>
	<script>
				var delta = JSON.parse($('#k_questionText').val());

				var toolbarOptions = [
						[ 'bold', 'italic', 'underline', 'strike' ],
						[ 'blockquote', 'code-block' ], [ {
							'header' : [ 1, 2, 3, 4, 5, 6, false ]
						} ], [ {
							'list' : 'ordered'
						}, {
							'list' : 'bullet'
						} ], [ {
							'script' : 'sub'
						}, {
							'script' : 'super'
						} ], [ {
							'indent' : '-1'
						}, {
							'indent' : '+1'
						} ], [ {
							'direction' : 'rtl'
						} ], [ 'link', 'image', 'formula' ], [ {
							'color' : []
						}, {
							'background' : []
						} ], [ {
							'font' : []
						} ], [ {
							'align' : []
						} ] ];

				var Questionquill = new Quill('#editor', {
					modules : {
						toolbar : toolbarOptions
					},
					theme : 'snow'
				});

				$('.ql-toolbar').css('visibility', 'hidden');
				$('#editor').css('border', 'none');
				Questionquill.setContents(delta);
				Questionquill.enable(false);
</script>
<script>
	 function moveUserpage(value){
		var loginUser = '${loginInfo.user_no}'*1;
		var clickUser = value.id.substring(value.id.lastIndexOf('_')+1)*1;
		if(loginUser == clickUser){
			location.href = "${pageContext.request.contextPath}/mypage/mypage?user_no="+loginUser;
		}else{
			location.href= "${pageContext.request.contextPath}/user/usersPage?user_no="+clickUser;
		}
	} 
</script>
	<!-- 답변 리스트  인클루드 하기 -->
	<%@include file="../answer/answerForm.jsp"%>

	<jsp:include page="../common/layout_footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

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
		<td style="height: 70px">
			<button type="button" class="btn k_qtagBtn">${questionInfo.q_tag}</button>
			<input type="text" class="form-control" id="k_qtag"
			value="${questionInfo.q_tag}" />

		</td>

	</tr>
	<tr>
		<!-- 추천 & 즐겨 찾기 -->
		<td rowspan="3"
			style="width: 15%; text-align: center; margin-top: 20px">
			<div id="k_recommand">
				<button type="button" class="btn" style="background-color: white">
					<i class="fa fa-chevron-up fa-2x" style="color: gray;"></i>
				</button>
				<h3>${questionInfo.q_recommand}</h3>
				<button type="button" class="btn" style="background-color: white">
					<i class="fa fa-chevron-down fa-2x" style="color: gray;"></i>
				</button>
			</div>
			<div id="k_bookmark" style="margin-top: 10px">
				<button type="button" class="btn" style="background-color: white">
					<i class="fa fa-star fa-2x" style="color: gray;"></i>
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

			</div> <%-- <div id="k_regdate" style="float:right"><p>${questionInfo.q_regdate}</p></div> --%>

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

				var quill = new Quill('#editor', {
					modules : {
						toolbar : toolbarOptions
					},
					theme : 'snow'
				});

				$('.ql-toolbar').css('visibility', 'hidden');
				$('#editor').css('border', 'none');
				quill.setContents(delta);
				quill.enable(false);
			</script>
		</td>
	</tr>
	<tr>
		<!-- 작성자 -->
		<td style="width: 85%"><c:if
				test="${loginInfo.user_no eq userInfo.user_no}">
				<button type="button" id="k_questionUpdate"
					class="btn btn-primary k_questionContentBtn"
					onclick="k_qeustionupdate()">수정</button>
				<button type="button" id="k_questionDelete" class="btn btn-danger k_questionContentBtn"
					data-toggle="modal" data-target="#myModal">삭제</button>

			</c:if> <jsp:include page="questionUser.jsp" /></td>
	</tr>
	<tr>
		<!-- 댓글 -->
		<td style="width: 85%">
			<!-- 인클루드 하기 -->
		</td>
	</tr>
</table>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog"> // fade는 투명 효과
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">삭제</h4>
      </div>
      <div class="modal-body">
        <p>정말 삭제 하시겠습니까??<br>삭제 하면 다시 복구 되지 않습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" onclick="k_questiondelete()">삭제</button>
      </div>
    </div>

  </div>
</div>


<script>
	function k_qeustionupdate() {

		//var now = $('#k_questionUpdate').val();
		if ($('#k_questionUpdate').text() == "수정") {
			//quill 툴바 보이기
			$('.ql-toolbar').css('visibility', 'visible');
			//수정 폼 테두리 설정
			$('#editor').css('border', '1px solid lightgray');
			//수정 폼 작성 가능
			quill.enable(true);
			//태그 및 제목 수정 가능
			$('#k_qTitle').css('display', 'none');
			$('.k_qtagBtn').css('display', 'none');
			$('#k_qtag').css('display', 'inline-block');
			$('#k_qtitleForm').css('display', 'inline-block');
			//삭제 버튼 숨기기
			$('#k_questionDelete').css('visibility', 'hidden');
			//버튼 수정 
			$('#k_questionUpdate').text('수정완료');
		} else {

			var qno = $('#k_qNO').val();
			qno *= 1;
			var title = $('#k_qtitleForm').val();
			var content = JSON.stringify(quill.getContents());
			var tag = $('#k_qtag').val();

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
								location.href = '${pageContext.request.contextPath}/question/questionView?q_no='
										+ qno;
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
					location.href = '${pageContext.request.contextPath}/question/questionView?q_no='
						+ qno;
				}
			},
			error : function() {
				alert('불행하게도 에러입니다 ㅠㅠ');
				
			}
		});//end ajax;
	}//end k_questiondelete()
</script>
<!-- 답변 리스트  인클루드 하기 -->

<jsp:include page="../common/layout_footer.jsp" />
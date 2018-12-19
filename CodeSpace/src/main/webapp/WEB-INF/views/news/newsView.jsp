<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->

	<button class="btn btn-outline-info my-2 my-sm-0" id="newslist"
		type="button" style="float: right;">
		<a href="${pageContext.request.contextPath}/news/news"
			style="text-decoration: none;">목록보기</a>
	</button>

	<div id="newsBoard">
		<table class="table col-12" style="background-color: white;">
			<thead>
				<th>${newsInfo.n_title }</th>
				<th style="float: right;">${newsInfo.n_regdate }</th>
			</thead>
			<tr>
				<td colspan="2">${newsInfo.n_content }</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button class="btn btn-success my-2 my-sm-0" id="newsEdit"
						type="button">
						<a
							href="${pageContext.request.contextPath}/news/newsEdit?n_no=${newsInfo.n_no}"
							style="text-decoration: none; color: white; text-decoration: none;">수정하기</a>
					</button>

					<button class="btn btn-danger my-2 my-sm-0" id="newsRemove"
						type="button" data-toggle="modal" data-target="#deleteConfirm">
						삭제하기</button>


					<div class="modal fade" id="deleteConfirm" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">삭제하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<h5>
										삭제하시겠습니까? <br>관리자 비밀번호를 입력해주십시오
									</h5>
									<div class="form-group">
										<input type="password" class="form-control" id="confirm_pw">
										<input type="hidden" name="n_no" value="${newsInfo.n_no }">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button class="btn btn-danger" id="deleteCon"
										onclick="del_news()">삭제하기</button>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<form method="post">
			<table class="table" style="background-color: white; margin-top: 0;">

				
				<c:if test="${!empty commList}">
					<c:forEach var="comm" items="${commList}" begin="0" end="${fn:length(commList) }">
						<tr>
							<td>
								<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${comm.user_no}">${comm.user_nickname }</a>
							</td>	
							<td colspan="2">
							<span id="testD_${comm.nc_no}">${comm.nc_content}</span>
								<input type="text" id="before_<c:out value="${comm.nc_no}"/>" style="display:none; width:1000px" value="${comm.nc_content }" />
							</td>	
							<td>	
								<div style="float: right;">
									<c:if test="${comm.user_no eq loginInfo.user_no}">
										<a onclick="edit_comm(${comm.nc_no})" id="modi_${comm.nc_no}" href="#">수정</a> &nbsp;
										<a onclick="return confirm('삭제하시겠습니까?')" href="${pageContext.request.contextPath}/news/commDelete?nc_no=${comm.nc_no}">삭제</a> &nbsp; 
									</c:if> 
									<span>${fn:substring(comm.nc_regdate, 0 ,10)} &nbsp;</span>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			<c:if test="${!empty loginInfo}">
			<table class="table row">
				<tr>
					<td style="width: 250px; float: right;">${loginInfo.user_nickname}
						<input type="hidden" name="n_no" value="${newsInfo.n_no }"><input type="hidden" name="user_no" value="${loginInfo.user_no }"></td>
					<td><textarea name="nc_content" cols="50" rows="2" id="commentContent"
							class="textarea m-tcol-c"
							style="overflow: hidden; width: 950px;"></textarea></td>
					<td><button type="submit" style="width: 100px; height: 55px;">등록</button> </td>
			</c:if>	
					
				</tr>
			</table>
		</form>
	</div>



	<script>
		var check_pw = '1234'; // 관리자 비밀번호

		
		// 뉴스 삭제하기
		function del_news() {
			var pw = $('#confirm_pw').val(); // 입력한 pw 값	 
			console.log(pw);

			// 입력한 pw와 관리자 pw가 같으면 
			if (pw == check_pw) {
				location.href = "${pageContext.request.contextPath}/news/newsDelete?n_no=${newsInfo.n_no}";
			} else {
				alert('비밀번호가 틀렸습니다.');
			}
		};
				
		
		
		
		// 댓글 수정하기		
		function edit_comm(no) {
			
			var content = $('#before_'+no).val();
			
			// 수정 버튼을 누르면
			if($('#modi_'+no).text() == '수정'){
				$('#testD_'+no).css('display','none');
				$('#before_'+no).css('display', '');
				$('#before_'+no).css('width', '1000px');
				$('#modi_'+no).text('수정하기')
			
				
			// 수정하기 버튼 누르면	
			} else if($('#modi_'+no).text() == '수정하기'){
				 $.ajax({
					 url : '${pageContext.request.contextPath}/news/commEdit',
					 type : 'POST',
					 data :{
						 "nc_no":no,
						 "nc_content": content
					 },
					 contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					 success : function(data){
						 //console.log(data)
							$('#testD_'+no).text($('#before_'+no).val());
							$('#testD_'+no).css('display','');
							$('#before_'+no).css('display', 'none');
							$('#modi_'+no).text('수정')
					 },
					 error:function(){
						 alert('error');
					 }
				}); 
			}
		}
	</script>
	<jsp:include page="../common/layout_footer.jsp" />
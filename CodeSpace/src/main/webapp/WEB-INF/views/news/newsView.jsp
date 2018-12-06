<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<%-- <tr>
			<td colspan="2">${newsInfo.n_photo }</td>
		</tr>
	 --%>
		</table>



	</div>
	<div align="center">
		<button class="btn btn-success my-2 my-sm-0" id="newsEdit"
			type="button">
			<a
				href="${pageContext.request.contextPath}/news/newsEdit?n_no=${newsInfo.n_no}"
				style="text-decoration: none; color: white; text-decoration: none;">수정하기</a>
		</button>

		<button class="btn btn-danger my-2 my-sm-0" id="newsRemove"
			type="button" data-toggle="modal" data-target="#deleteConfirm">
			삭제하기
		</button>


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
							<button class="btn btn-danger" id="deleteCon" onclick="del_news()" >삭제하기</button>
						</div>
				</div>
			</div>
		</div>
	</div>


	<script>
			var check_pw = '1234'; // 관리자 비밀번호
	 
			function del_news() {
			var pw = $('#confirm_pw').val(); // 입력한 pw 값	 
			console.log(pw);
			
			// 입력한 pw와 관리자 pw가 같으면 
			if(pw == check_pw){
		 		location.href = "${pageContext.request.contextPath}/news/newsDelete?n_no=${newsInfo.n_no}";
			} else {
				alert('비밀번호가 틀렸습니다.');
			}
		};
	</script>
<jsp:include page="../common/layout_footer.jsp" />
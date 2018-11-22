<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">

	<ul class="nav nav-pills">
		<li class="nav-item">
			<a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false" style="color:lightgray;">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myqst?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 질문</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myans?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 답변</a> 
				<a class="dropdown-item" href="#">즐겨찾기</a>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/mypage/myPrj?user_no=${loginInfo.user_no}" style="color:lightgray;">프로젝트</a></li>
	</ul>


<%-- 	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active"
			href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false" style="color: lightgray;">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/mypage/myqst?user_no=${loginInfo.user_no}">내가
					한 질문</a> <a class="dropdown-item"
					href="${pageContext.request.contextPath}/mypage/myans?user_no=${loginInfo.user_no}">내가
					한 답변</a> <a class="dropdown-item" href="#">즐겨찾기</a>
			</div></li>
		<c:if test="${loginInfo.user_score >= 31}">
			<li class="nav-item"><a class="nav-link"
				href="#" style="color: lightgray;">프로젝트</a></li>
		</c:if>
	</ul> --%>

	<div class="y_profile_wrapper">
		<div class="y_profile_myPhoto">
			<img class="y_userphoto"
				src="${pageContext.request.contextPath}/uploadfile/userphoto/${loginInfo.user_photo}">
			
		</div>

		<div class="y_profile_myInfo">

			<table class="table">
				<tr>
					<td>아이디</td>
					<td>${loginInfo.user_id }/td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${loginInfo.user_name }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${loginInfo.user_nickname }</td>
				</tr>
				<tr>
					<td>내 HP</td>
					<td>${loginInfo.user_url }</td>
				</tr>
				<tr>
					<td>내 소개</td>
					<td>${loginInfo.user_intro }</td>
				</tr>
				<tr>
					<td>내가 획득한 점수</td>
					<td>${loginInfo.user_score }</td>
				</tr>
				<tr>
					<td>내가 관심있는 태그</td>
					<td>${loginInfo.user_tag }</td>
				</tr>
			</table>

		</div>
		<div>
			<a href="editForm?user_id=${loginInfo.user_no}"> <input
				class="btn btn-success yu_btn1" type="button" value="수정하기"></a>
		</div>

		<div>
			<!-- 탈퇴하기 버튼 -->
			<input type="submit" class="btn btn-default yu_btn_del"
				data-target="#layerpop" data-toggle="modal" value="탈퇴하기"> <br />

			<!-- 탈퇴하기 버튼누르면 모달창 뜨게 -->
			<div class="modal fade" id="layerpop">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- header -->
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">탈퇴하기</h4>
						</div>
						<!-- body -->
						<div class="modal-body">
							탈퇴하시겠습니까?<br> 탈퇴 시 내가 작성한 질문, 답변, 프로젝트는 남아있고 <br> 가입
							정보와 포인트만 삭제됩니다.
						</div>
						<!-- Footer -->
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="아니요"> <input type="button" class="btn btn-danger"
								onclick="del_mypage()" value="탈퇴하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function del_mypage() {
			location.href = "${pageContext.request.contextPath}/mypage/delete?user_id=${loginInfo.user_id}";
		};

		/* $("document").click(function(){
		
		 $('input[data-oper="delete"]').on("click", function(e){
		 layerpop.attr("action", "/mypage/delete-account");
		 layerpop.submit();
		 });
		 }); */
	</script>

	<jsp:include page="../common/layout_footer.jsp" />
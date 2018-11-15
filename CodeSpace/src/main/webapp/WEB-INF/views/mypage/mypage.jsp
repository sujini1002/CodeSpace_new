<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->

<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}">내 활동</a></li>
</ul>

<div class="y_profile_wrapper">
	<div class="y_profile_myPhoto"></div>

	<div class="y_profile_myInfo">

		<table class="table">
			<tr>
				<td>아이디</td>
				<td>${loginInfo.user_id }</td>
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
		<a href="editForm?user_id=${loginInfo.user_id}"> <input
			class="btn btn-success yu_btn1" type="button" value="수정하기"></a>
	</div>

	<div>
		<!-- 탈퇴하기 버튼 -->
		<input type="submit" class="btn btn-default yu_btn_del" data-target="#layerpop" data-toggle="modal" value="탈퇴하기"> <br />
		
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
						탈퇴하시겠습니까?<br> 탈퇴 시 내가 작성한 질문, 답변, 프로젝트는 남아있고 <br> 가입 정보와 포인트만
						삭제됩니다.
					</div>
					<!-- Footer -->
					<div class="modal-footer">
					 	<input type="button" class="btn btn-default" data-dismiss="modal" value="아니요">
						
						<input type="button"  class="btn btn-danger" onclick="del_mypage()"value="탈퇴하기">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

 function del_mypage(){
	location.href="${pageContext.request.contextPath}/mypage/delete?user_id=${loginInfo.user_id}";
};  

/* $("document").click(function(){
		
	$('input[data-oper="delete"]').on("click", function(e){
		layerpop.attr("action", "/mypage/delete-account");
		layerpop.submit();
	});
}); */
 </script>

<jsp:include page="../common/layout_footer.jsp" />

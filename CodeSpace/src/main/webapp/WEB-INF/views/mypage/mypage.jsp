<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->

<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/activity">내 활동</a></li>
</ul>

<div class="y_profile_wrapper">
	<div class="y_profile_myPhoto">
		<a href="editForm?user_id=${loginInfo.user_id}"><input class="btn btn-success yu_btn1" type="button" value="수정하기"></a>
	</div>

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
</div>












<jsp:include page="/resources/common/layout_footer.jsp" />

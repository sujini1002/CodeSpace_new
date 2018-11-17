<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->

<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/users-page?user_no={userInfoVo.user_no}">프로필</a></li>
	<%-- <li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/activity">내 활동</a></li> --%>
</ul>
<input type="text" name="" value="<c:out value=${userInfoVo.user_no} }">

<div class="y_profile_wrapper">
	<div class="y_profile_myPhoto">{userInfoVo.score}<p>포인트</p></div>

	<div class="y_profile_myInfo">

		<table class="table">
			<tr>
				<td>${userInfoVo.user_id }</td>
			</tr>
			<tr>
				<td>${userInfoVo.user_nickname }</td>
			</tr>
			<tr>
				<td>${userInfoVo.user_intro }</td>
			</tr>
			<tr>
				<td>${userInfoVo.user_url }</td>
			</tr>
			<tr>
				<td>${userInfoVo.user_tag }</td>
			</tr>
		</table>
	</div>
</div>






<jsp:include page="../common/layout_footer.jsp" />

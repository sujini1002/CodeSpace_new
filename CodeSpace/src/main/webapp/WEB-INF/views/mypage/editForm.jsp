<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp"/>
<!--  여기다가 작성 해주세요 -->

<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/activity">내 활동</a></li>
</ul>
<div class="y_profile_wrapper">
<div class="y_edit_myPhoto">
 <input type="file" name="user_photo" class="y_btn_file"
					value="${userInfoVo.user_photo}" />
</div>
<div class="y_editForm">
		<form method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td class="item">아이디</td>
					<td class="contents"><input type="text" name="user_id"
					value="${userInfoVo.user_id}" readonly/></td>
				</tr>
				<tr>
					<td class="item">이름</td>
					<td class="contents"><input type="text" name="user_name"
					value="${userInfoVo.user_name}" /></td>
				</tr>
				<tr>
					<td class="item">내 소개</td>
					<td class="contents"><input type="text" name="user_intro"
					value="${userInfoVo.user_intro}" /></td>
				</tr>
				<tr>
					<td class="item">내가 관심있는 태그</td>
					<td class="contents"><input type="text" name="user_tag"
					value="${userInfoVo.user_tag}" /></td>
				</tr>
			</table>
		</form>
	</div>
	<input class="btn btn-success yu_btn2" type="submit" value="수정완료">
</div>







	
<jsp:include page="/resources/common/layout_footer.jsp" />

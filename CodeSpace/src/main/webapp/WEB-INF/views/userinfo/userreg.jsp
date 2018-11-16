<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<form method="post" enctype="multipart/form-data">
	<table class="table h_table">
		<thead>
			<tr>
				<th>아이디</th>
				<c:if test="${empty googlecheck}">
					<td><input type="text" name="user_id" value="${googlecheck}"/></td>
				</c:if>
				<c:if test="${!empty googlecheck}">
					<td><input type="text" name="user_id" value="${googlecheck}" readonly="readonly" /></td>
				</c:if>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>별명</th>
				<td><input type="text" name="user_nickname" /></td>
			</tr>
		</thead>
		
		<thead>
			<tr>
				<th>개인 홈페이지</th>
				<td><input type="text" name="user_url" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>자기 소개</th>
				<td><input type="text" name="user_intro" /></td>				
			</tr>
		</thead>
		<thead>
			<tr>
				<th>Tag</th>
				<td><input type="text" name="user_tag" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo" /></td>
			</tr>
		</thead>
			<tr>		
				<td><input type="submit" value="회원가입" /></td>
			</tr>
	</table>
</form>
<jsp:include page="../common/layout_footer.jsp" />

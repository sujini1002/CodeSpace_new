<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<form method="post">
	<table class="table">
		<tr>
			<td class="item">
				<h3>탈퇴 처리를 위해 아이디를 입력해 주십시오.</h3>
			</td>
		</tr>
		<tr>
			<td class="contents"><input type="text" name="user_id"></td>
		</tr>
		<tr>
			<td class="contents"><input type="submit" value="탈퇴하기"></td>
		</tr>

	</table>
</form>

<jsp:include page="/resources/common/layout_footer.jsp" />

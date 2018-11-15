<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<ul class="nav nav-tabs">
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}">내
			활동</a></li>
</ul>

<h3>내가 작성한 질문</h3>
<table class="table" border="1" style="text-align: center;">
	<thead>
		<tr>
			<th style="width: 50px; text-align: center;">번호</th>
			<th style="width: 200px; text-align: center;">제목</th>
			<th style="width: 100px; text-align: center;">작성일</th>
		</tr>
	</thead>
	<c:forEach items="${myQst}" var="qst" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href='${pageContext.request.contextPath}/question/questionView?q_no=<c:out value="${qst.q_no}"/>'> ${qst.q_title}</a></td>
			<td>${qst.q_regdate}</td>
		</tr>
	</c:forEach>

</table>
<!-- 내가 한 답변 -->










<jsp:include page="../common/layout_footer.jsp" />

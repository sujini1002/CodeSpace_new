<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
<%-- 	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}&page=${page}">내 활동</a></li>
	</ul> --%>

	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link"
			href="${pageContext.request.contextPath}/mypage/mypage"
			style="color: gray;">프로필</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle active" data-toggle="dropdown" href="#"
			role="button" aria-haspopup="true" aria-expanded="false">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myqst?user_no=${loginInfo.user_no}">내가 한 질문</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myans?user_no=${loginInfo.user_no}">내가 한 답변</a> 
				<a class="dropdown-item" href="#">즐겨찾기</a>
			</div>
		</li>
	</ul>




	<br>
	<h1>내가 작성한 질문</h1>
	<table class="table" style="text-align: center;">
		<thead>
			<tr>
				<th style="width: 30px; text-align: center;">번호</th>
				<th style="width: 100px; text-align: center;">제목</th>
				<th style="width: 30px; text-align: center;">작성일</th>
			</tr>
		</thead>
		<c:forEach var="qst" items="${myQst.myQuestionList}" begin="0"
			end="${fn:length(myQst.myQuestionList) }" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a
					href='${pageContext.request.contextPath}/question/questionView?q_no=<c:out value="${qst.q_no}"/>'>
						${qst.q_title}</a></td>
				<td>${fn:substring(qst.q_regdate, 0 ,10)}</td>
				<%-- <td>${qst.q_regdate}</td> --%>
				<%-- <td><fmt:formatDate value="${qst.q_regdate}" pattern="yyyy-MM-dd"></td>  --%>
			</tr>
		</c:forEach>
	</table>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span></a></li>
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}&page=1">1</a></li>
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}&page=2">2</a></li>
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}&page=3">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</nav>



	<!-- 내가 한 답변 -->










	<jsp:include page="../common/layout_footer.jsp" />
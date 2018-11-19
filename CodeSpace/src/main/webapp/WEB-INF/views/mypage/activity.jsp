<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<ul class="nav nav-pills">
	<li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage"  style="color:gray;">프로필</a></li>
	<li class="nav-item"> <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/activity?user_no=${loginInfo.user_no}&page=${page}">내
			활동</a></li>
</ul>
<br>
<h4>내가 작성한 질문</h4>
<table class="table"  style="text-align: center;">
	<thead>
		<tr>
			<th style="width: 30px; text-align: center;">번호</th>
			<th style="width: 130px; text-align: center;">제목</th>
			<th style="width: 50px; text-align: center;">작성일</th>
		</tr>
	</thead>
	<c:forEach var="qst" items="${myQst.myQuestionList}"  begin="0" end="${fn:length(myQst.myQuestionList) }" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href='${pageContext.request.contextPath}/question/questionView?q_no=<c:out value="${qst.q_no}"/>'> ${qst.q_title}</a></td>
			 <td>${qst.q_regdate}</td> 
			<%-- <td><fmt:formatDate value="${qst.q_regdate}" pattern="yyyy-MM-dd"></td>  --%>
		</tr>
	</c:forEach>

</table>
<!-- 내가 한 답변 -->










<jsp:include page="../common/layout_footer.jsp" />

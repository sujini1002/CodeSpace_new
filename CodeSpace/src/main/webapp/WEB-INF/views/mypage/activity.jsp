<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<ul class="nav nav-tabs">
	<li role="presentation"><a href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/mypage/activity">내 활동</a></li>
</ul>











<jsp:include page="/resources/common/layout_footer.jsp" />

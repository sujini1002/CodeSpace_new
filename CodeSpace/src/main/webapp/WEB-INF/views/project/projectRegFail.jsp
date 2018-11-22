<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!-- 여기부터 화면 코드 작성해주세요 -->
	
	<h3>프로젝트는 '중수' 등급부터 만들 수 있습니다:></h3>
	<a href="${pageContext.request.contextPath }/question/insertQuestion">질문하러 가기</a>
<hr>


<jsp:include page="../common/layout_footer.jsp" />
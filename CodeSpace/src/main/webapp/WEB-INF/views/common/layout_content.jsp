<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <div id="k_content">

	<div id="k_leftNavBar">
		<jsp:include page="layout_side.jsp" />
	</div>
	<div id="k_rightContent"> --%>

<div class="container-fluid row">
	<!-- nav 밑부분을 다 감싸는 wrapper  -->
	<!-- <div class="row"> -->
	<!-- leftSide bar 시작 -->

	<nav class="col-md-2" style="background-color: #343a40; padding-top: 30px;">
		<div class="sidebar-sticky">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/questions/questions">코드스페이스
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/search/userList">사용자</a></li>
				<li><a class="nav-link" href="#">태그</a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/project/prjreg?user_no=${loginInfo.user_no}">프로젝트</a></li>
				<li><a class="nav-link" onclick="chatwindow()">채팅(미구현)</a></li>

				 <%-- <c:if test="${!loginInfo.isEmpty() }"> 
					<li><a class="nav-link" href="#">프로젝트</a></li>
				</c:if>  --%>
			</ul>
		</div>
	</nav>



	<script>
		function chatwindow() {
			window.open("/cos/chatting/chattingWindow", "채팅창",
					"width=400, height=500, toolbar=no, menubar=no");
		}
	</script>
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
					href="${pageContext.request.contextPath}/questions/questions"><i class="fas fa-home" style="color:white;">&nbsp;&nbsp;코드스페이스</i>
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/search/userList"><i class="fas fa-user-friends" style="color:white;">&nbsp;&nbsp;사용자</i></a></li>
				<li><a class="nav-link" href="#"><i class="fas fa-hashtag" style="color:white;">&nbsp;&nbsp;태그</i></a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/project/prjreg?user_no=${loginInfo.user_no}"><i class="fas fa-project-diagram" style="color:white;">&nbsp;&nbsp;프로젝트</i></a></li>
				<li><a class="nav-link" onclick="chatwindow()"><i class="fas fa-comment" style="color:white;">&nbsp;&nbsp;채팅(미구현)</i></a></li>

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
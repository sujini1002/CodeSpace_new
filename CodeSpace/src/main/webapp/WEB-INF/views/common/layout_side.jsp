<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<nav class="col-md-2" style="background-color: #343a40; padding-top: 30px;">
		<div class="sidebar-sticky" > <!--style=" position:fixed;"  -->
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/questions/questions"><i class="fas fa-home" style="color:white;">&nbsp;&nbsp;코드스페이스</i>
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/user/userList"><i class="fas fa-user-friends" style="color:white;">&nbsp;&nbsp;사용자</i></a></li>
				<li><a class="nav-link"
					href="${pageContext.request.contextPath}/project/prjreg?user_no=${loginInfo.user_no}"><i class="fas fa-project-diagram" style="color:white;">&nbsp;&nbsp;프로젝트</i></a></li>
				<li><a class="nav-link" 
				href="${pageContext.request.contextPath}/news/news"><i class="fas fa-info-circle" style="color:white;">&nbsp;&nbsp;소식</i></a></li>
				<!-- <li><a class="nav-link" onclick="chatwindow()"><i class="fas fa-comment" style="color:white;">&nbsp;&nbsp;채팅(미구현)</i></a></li> -->

				 <%-- <c:if test="${!loginInfo.isEmpty() }"> 
					<li><a class="nav-link" href="#">프로젝트</a></li>
				</c:if>  --%>
			</ul>
		</div>
	</nav>
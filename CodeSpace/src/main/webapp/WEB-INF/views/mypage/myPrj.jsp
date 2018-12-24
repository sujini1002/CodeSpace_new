<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<ul class="nav nav-pills">
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage"  style="color:black;">프로필</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false" style="color:black;">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myqst?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 질문</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myans?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 답변</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myBookmark?page=1&perPageNum=10&user_no=${loginInfo.user_no}">즐겨찾기</a>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link active" href="${pageContext.request.contextPath}/mypage/myPrj?user_no=${loginInfo.user_no}" style="color:white;">프로젝트</a></li>
	</ul>

	<div class="container">
		<div class="head-container">
			<br>
			<h1>내 프로젝트</h1>
		</div>
		<br>
		<div class="main-container">
			<c:if test="${empty myPrjList}">
				<div class="result-noList">
					<h2>내가 참여한 프로젝트가 없습니다.   </h2>
				</div>
			</c:if>
			
			<!-- 프로젝트가 진행중일 때 -->
			<c:if test="${!empty myPrjList}">
			<%-- <c:if test="${!empty myPrjList && myPrjList.project_status == 1}"> --%>
				<div class="result-List">
					<table class="table" style="text-align: center;">
						<tr>
							<td style="text-align: center;">프로젝트 제목</td>
							<td style="text-align: center;">프로젝트 내용</td>
							<td style="text-align: center;">프로젝트 상태</td>
							<td style="text-align: center;">프로젝트 시작일</td>
							<td style="text-align: center;">프로젝트 종료일</td>
						</tr>
						<c:forEach var="prj" items="${myPrjList}" begin="0" end="${fn:length(myPrjList)}" >
						 <tr>
							<td><a href='${pageContext.request.contextPath}/project/prjdash?project_no=<c:out value="${prj.project_no}"/>&user_no=<c:out value="${loginInfo.user_no}"/>'>${prj.project_title}</a></td>
							<td>${prj.project_content}</td>
							<c:if test="${prj.project_status ==false}">
								<td style="color:red;">종료</td>
							</c:if>
							<c:if test="${prj.project_status ==true}">
								<td style="color:blue;">진행중</td>
							</c:if>
							<td>${prj.prostring_startdate}</td>
							<td>${prj.prostring_enddate}</td> 
						</tr> 
						</c:forEach> 
					</table>
				</div>
			</c:if>
		</div>
		<!-- main-container -->
	</div>
	<!-- container 끝 -->



	<jsp:include page="../common/layout_footer.jsp" />
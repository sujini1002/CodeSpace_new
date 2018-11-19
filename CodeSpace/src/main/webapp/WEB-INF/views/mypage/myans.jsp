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
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage" style="color: gray;">프로필</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle active" data-toggle="dropdown" href="#" 
			role="button" aria-haspopup="true" aria-expanded="false">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath}/mypage/myqst?user_no=${loginInfo.user_no}">내가 한 질문</a> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myans?user_no=${loginInfo.user_no}">내가 한 답변</a> 
					<a class="dropdown-item" href="#">즐겨찾기</a>
			</div>
		</li>
	</ul>

	<div class="container">
		<div class="head-container">
		<br>
			<h1>내가 작성한 답변</h1>
		</div>

		<br>

		<div class="list-container">
			<c:if test="${empty myAnsList}">
				<div class="result-noList">
					<h2>질문이 없습니다.</h2>
				</div>
			</c:if>

			<c:if test="${!empty myAnsList}">
				<div class="result-List">
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 30px; text-align: center;">번호</th>
								<th style="width: 100px; text-align: center;">질문 제목</th>
								<th style="width: 30px; text-align: center;">답변 작성일</th>
								<th style="width: 30px; text-align: center;">채택여부</th>
							</tr>
						</thead>
						<c:forEach var="ans" items="${myAnsList}" begin="0"
							end="${fn:length(myAnsList) }" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a
									href='${pageContext.request.contextPath}/question/questionView?q_no=<c:out value="${qst.q_no}"/>'>
										${ans.q_title}</a></td>
								<td>${fn:substring(ans.a_regdate, 0 ,10)}</td>
								<td>${ans.a_choose}</td>
							</tr>
						</c:forEach>
					</table>
					<!-- 질문 글이 있을 시 페이징 표시 -->
					<div class="search-paging">
						<!-- view 단 페이징 모듈은 여기부터 -->
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="${pageContext.request.contextPath}/questions/questions${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="paging-number"
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="${pageContext.request.contextPath}/questions/questions${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="paging-number"><a
										href="${pageContext.request.contextPath}/questions/questions${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						<!-- 여기 까지 -->
					</div>
				</div>
				<!-- result-List 끝 -->
			</c:if>
		</div>
		<!-- list-container 끝 -->
	</div>
	<!-- container 끝  -->



	<jsp:include page="../common/layout_footer.jsp" />
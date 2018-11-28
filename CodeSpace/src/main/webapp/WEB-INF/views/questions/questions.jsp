<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<div class="container">
		<div class="head-container">
			<h1>All Questions</h1>
		</div>

		<br> <br>
		<div class="list-container">
			<c:if test="${empty list}">
				<div class="result-noList">
					<h2>질문이 없습니다.</h2>
				</div>
			</c:if>

			<c:if test="${!empty list}">
				<div class="result-List">
					<hr class="top-hr">
					<c:forEach var="questionList" items="${list}">
						<div class="row result-row">
							<div class="col-lg-1 question-viewCnt">
								<div class="question-number">${questionList.q_viewCnt}</div>
								<h6>조회</h6>
							</div>
							<div class="col-lg-1 question-recommCnt">
								<div class="question-number">${questionList.q_recommand}</div>
								<h6>추천</h6>
							</div>
							<div class="col-lg-7 question-title">
								<div class="result-link">
									<h3>
										<a
											href="${pageContext.request.contextPath}/question/questionView?q_no=${questionList.q_no}">${questionList.q_title}</a>
									</h3>
								</div>
								<span class="result-tag"><a href="#"><h6>${questionList.q_tag}</h6></a></span>
							</div>
							<!-- question-title 끝 -->
							<div class="col-lg-2 question-info">
								<a href="#">${questionList.user_nickname}</a>
							</div>
						</div>
						<!-- 게시글 row행 끝 -->
						<hr />
					</c:forEach>

					<br>
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
										<c:out value="${pageMaker.searchCri.page == idx?'class =active':''}"/>>
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
					<!-- search-paging 끝 -->
				</div>
				<!-- result-List 끝 -->
			</c:if>
			<!-- !empty 조건 -->
		</div>
		<!-- list-container 끝 -->
	</div>
	<!-- container 끝  -->


	<!-- 주석 -->
	<jsp:include page="../common/layout_footer.jsp" />
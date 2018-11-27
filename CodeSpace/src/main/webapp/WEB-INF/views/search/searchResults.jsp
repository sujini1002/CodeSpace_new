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
	<script>
		
	</script>


	<div class="container">
		<div class="head-container">
			<h1>Search Results</h1>
		</div>

		<br> <br>
		<div class="list-container">
			<c:if test="${empty list}">
				<div class="result-noList">
					<h4>검색 키워드 : "${keyword}"</h4>
					<br>
					<h2>"${keyword}"에 대해 검색된 결과가 없습니다.</h2>


					<!-- 구글 서치  박스-->
					<div>
						<script>
							(function() {
								var cx = '006034808662729394004:kccd4zjflrq';
								var gcse = document.createElement('script');
								gcse.type = 'text/javascript';
								gcse.async = true;
								gcse.src = 'https://cse.google.com/cse.js?cx='
										+ cx;
								var s = document.getElementsByTagName('script')[0];
								s.parentNode.insertBefore(gcse, s);
								$('#gsc-i-id1').val('${keyword}');
							})();

							//$('#gsc-i-id1').val('${keyword}');
							//$('input[type="text"]').val('${keyword}');
						</script>
						<gcse:searchbox></gcse:searchbox>
						<script>
							window.onload = function() {
								$('#gsc-i-id1').val('${keyword}');
							};
						</script>

					</div>

					<!-- 구글 서치 결과 나오는 곳  -->
					<div>
						<gcse:searchresults></gcse:searchresults>
					</div>

				</div>
			</c:if>

			<c:if test="${!empty list}">

				<c:if test="${fn:trim(keyword) eq '' or keyword eq null}">
					<c:set var="value" value="" />
					<div class="result-noList">
						<h2>입력된 값이 없습니다! 입력 값 확인 후 다시 검색해주세요.</h2>
					</div>
				</c:if>

				<c:if test="${fn:trim(keyword) ne '' and keyword ne null}">
					<div class="result-List">
						<h4>검색 키워드 : "${keyword}"</h4>
						<br>
						<h5>"${keyword}"에 대한 ${pageMaker.totalCount}개의 검색 결과</h5>
						<hr>
						<c:forEach var="searchResult" items="${list}">
							<div class="row result-row">
								<div class="col-lg-1 question-viewCnt">
									<div class="question-number">${searchResult.q_viewCnt}</div>
									<h6>조회</h6>
								</div>
								<div class="col-lg-1 question-recommCnt">
									<div class="question-number">${searchResult.q_recommand}</div>
									<h6>추천</h6>
								</div>
								<div class="col-lg-7 question-title">
									<div class="result-link">
										<h3>
											<a
												href="${pageContext.request.contextPath}/question/questionView?q_no=${searchResult.q_no}">${searchResult.q_title}</a>
										</h3>
									</div>
									<span class="result-tag"><a href="#"><h6>${searchResult.q_tag}</h6></a></span>
								</div>
								<div class="col-lg-2 question-info">
									<a href="#">${searchResult.user_nickname}</a>
								</div>
							</div>
							<!-- 게시글 row행 끝 -->
							<hr />
						</c:forEach>

						<br>
						<!-- 검색 결과가 있을 시 페이징 표시 -->
						<div class="search-paging">
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li><a
											href="${pageContext.request.contextPath}/search/searchResults${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li class="paging-number"
											<c:out value="${pageMaker.searchCri.page == idx?'class =active':''}"/>>
											<a
											href="${pageContext.request.contextPath}/search/searchResults${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${pageContext.request.contextPath}/search/searchResults${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<!-- result-List 끝 -->
				</c:if>
				<!-- ne 조건 -->
			</c:if>
			<!-- !empty 조건 -->
		</div>
		<!-- list-container 끝 -->

	</div>
	<!-- container 끝  -->
	<script>
		$('#gsc-i-id1').val('${keyword}');
	</script>


	<!-- 주석 -->
	<jsp:include page="../common/layout_footer.jsp" />
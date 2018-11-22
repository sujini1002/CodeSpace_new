<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<br> <br>

	<div class="row justyfy-content-center">
		<div class="col-3">
			<div class="y_usersP_photo">
				<img class="y_usersP_1"
					src="${pageContext.request.contextPath}/uploadfile/userphoto/${usersInfo.user_photo}">
				
			</div>
		</div>
		<div class="col-4 y_usersP_intro">
			<h3 style="">
				<i class="fas fa-user-astronaut"></i>&nbsp;${usersInfo.user_nickname }
			</h3>
			<p>
				<i class="fas fa-quote-left"></i>&nbsp;&nbsp;${usersInfo.user_intro }&nbsp;&nbsp;<i
					class="fas fa-quote-right"></i>
			</p>
			<p>
				<i class="fas fa-edit"></i>&nbsp;&nbsp;${usersInfo.user_tag }
			</p>
		</div>
		<div class="col-3 row y_userP_info justyfy-content-center">
		<h4 style="padding-left: 50px; padding-top:15px;" class="y_userP_score"><i class="fas fa-pencil-alt"></i> 
				&nbsp;${usersInfo.user_score}&nbsp;포인트</h4>  
			<div class="col-6 y_userP_info1">
				<h1>${qstCnt}</h1>
				<p>questions</p>
			</div>
			<div class="col-6 y_userP_info2">
				<h1>${ansCnt}</h1>
				<p>answers</p>
			</div>
		</div>
	</div>
	<br> <br>
	<ul class="nav nav-tabs">
	
		<li class="nav-item"><a class="nav-link" 
		href="${pageContext.request.contextPath}/user/usersPage?user_no=${usersInfo.user_no}">질문</a></li>
		<li class="nav-item"><a class="nav-link active" 
		href="${pageContext.request.contextPath}/user/usersPageA?user_no=${usersInfo.user_no}">답변</a></li>
		
	</ul>
	<!-- head-container end -->

	
	<div class="ans-container col-12">
		<div class="list-container">
			<c:if test="${empty ansList}">
				<div class="result-noList">
					<h2>${usersInfo.user_nickname }님이 작성한 답변이 없습니다.</h2>
				</div>
			</c:if>

			<c:if test="${!empty ansList}">
				<div class="result-List row">
					<table class="table " style="text-align: center;">
						<thead>
							<tr>
								<th class="col-md-1" style="width: 30px; text-align: center;">번호</th>
								<th class="col-md-7" style="width: 100px; text-align: center;">질문
									제목</th>
								<th class="col-md-2" style="width: 30px; text-align: center;">답변
									작성일</th>
								<th class="col-md-1" style="width: 30px; text-align: center;">채택여부</th>
							</tr>
						</thead>
						<c:forEach var="ans" items="${ansList}" begin="0"
							end="${fn:length(ansList) }" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td style="text-align: left;"><a
									href='${pageContext.request.contextPath}/question/questionView?q_no=${ans.q_no}'>
										${ans.q_title}</a></td>
								<td>${fn:substring(ans.a_regdate, 0 ,10)}</td>
								<td><c:set var="result" value="${ans.a_choose}" /> <c:choose>
										<c:when test="${result == 1 }"> 
									채택 됨:P
									</c:when>
										<c:otherwise>
									미채택
									</c:otherwise>
									</c:choose></td>
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
										href="${pageContext.request.contextPath}/user/usersPageA${pageMaker.makeQuery(pageMaker.startPage - 1)}&user_no=${usersInfo.user_no}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMakerA.endPage}" var="idx">
									<li class="paging-number"
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a
										href="${pageContext.request.contextPath}/user/usersPageA${pageMaker.makeQuery(idx)}&user_no=${usersInfo.user_no}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMakerA.endPage > 0}">
									<li class="paging-number"><a
										href="${pageContext.request.contextPath}/user/usersPageA${pageMaker.makeQuery(pageMaker.endPage + 1)}&user_no=${usersInfo.user_no}">&raquo;</a></li>
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
	<!-- ans-container end -->
</div>
<!-- main container end -->

<!-- container end -->





<jsp:include page="../common/layout_footer.jsp" />
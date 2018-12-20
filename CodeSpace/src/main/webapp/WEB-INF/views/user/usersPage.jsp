<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<br> <br>


	<div class="row">
		<div class="col-3">
			<div class="y_usersP_photo">
				<img class="y_usersP_1"
					src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${usersInfo.user_photo==null}">noimage.png</c:when><c:otherwise>${usersInfo.user_photo}</c:otherwise></c:choose>">
				<%-- <img class="y_usersP_1"
					src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/${usersInfo.user_photo}"> --%>
				<%-- <img class="y_usersP_1"
					src="${pageContext.request.contextPath}/uploadfile/userphoto/${usersInfo.user_photo}"> --%>
			</div>
		</div>
		
		<script>
		
		$(document).ready(function(){
			
			var tags = '${usersInfo.user_tag}';
			var tagArr = tags.split("/");
			
			for(var i in tagArr){
				if(tagArr[i] != ''){
					$('.userInfo-tag').append('<div class="tag-box"><button type="button" onclick="moveTag(this.value)" class="btn btn-sm" value="'+ tagArr[i] +'">'+tagArr[i]+'</button></div>');
				}
			}
			
		});
		
		function moveTag(tag){
			
			var tagValue = tag;
			
			location.href="${pageContext.request.contextPath}/search/tagged?tag="+tagValue;
			
		}
			
		</script>
		
		<div class="col-4 y_usersP_intro">
			<h3 style="">
				<i class="fas fa-user-astronaut"></i>&nbsp;${usersInfo.user_nickname }
				<c:forEach var="i" items="${topList}" begin="0" end="${fn:length(topList)}">
					<c:if test="${usersInfo.user_no == i.user_no }">
						<h6><span class="badge badge-info">우주최강개발자</span></h6>
					</c:if>
				</c:forEach>
			</h3>
			 <%-- <c:if test="${!empty usersQst}"> --%>
			<p>
				<i class="fas fa-quote-left"></i>&nbsp;&nbsp;${usersInfo.user_intro }&nbsp;
				<i class="fas fa-quote-right"></i>
			</p>
			<div class="userInfo-tag"></div>
			<%-- </c:if> --%>
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
	<br>
	<br>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" 
		href="${pageContext.request.contextPath}/user/usersPage?user_no=${usersInfo.user_no}">질문</a></li>
		<li class="nav-item"><a class="nav-link" 
		href="${pageContext.request.contextPath}/user/usersPageA?user_no=${usersInfo.user_no}" style="color:gray;">답변</a></li>
	</ul>
	
	<!-- head-container end -->
	<div class="main-container row">
		<div class="qst-container col-12">
			<div class="list-container">
				<c:if test="${empty usersQst}">
					<div class="result-noList">
					<br>
						<h3>${usersInfo.user_nickname}님이 작성한 질문이 없습니다.</h3>
					</div>
				</c:if>
				<c:if test="${!empty usersQst}">
					<div class="result-List row">

						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th style="width: 30px; text-align: center;">번호</th>
									<th style="width: 100px; text-align: center;">제목</th>
									<th style="width: 30px; text-align: center;">작성일</th>
								</tr>
							</thead>
							<c:forEach var="qst" items="${usersQst}" begin="0"
								end="${fn:length(usersQst) }" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td style="text-align: left;"><a
										href='${pageContext.request.contextPath}/question/questionView?q_no=${qst.q_no}'>
											${qst.q_title}</a></td>
									<td>${fn:substring(qst.q_regdate, 0 ,10)}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 질문 글이 있을 시 페이징 표시 -->
						<div class="search-paging">
							<!-- view 단 페이징 모듈은 여기부터 -->
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/user/usersPage${pageMaker.makeQuery(pageMaker.startPage - 1)}&user_no=${usersInfo.user_no}">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li class="page-item"
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a class="page-link"
											href="${pageContext.request.contextPath}/user/usersPage${pageMaker.makeQuery(idx)}&user_no=${usersInfo.user_no}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/user/usersPage${pageMaker.makeQuery(pageMaker.endPage + 1)}&user_no=${usersInfo.user_no}">&raquo;</a></li>
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
		<!-- qst-container end -->


		

	<jsp:include page="../common/layout_footer.jsp" />
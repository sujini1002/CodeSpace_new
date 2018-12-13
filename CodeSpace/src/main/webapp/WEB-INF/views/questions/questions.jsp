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
			<div class="row">
				<div class="col-md-9">
					<h1>All Questions</h1>
				</div>
				<div class="col-md-3">
					<button type="button" 
						class="btn btn-default btn btn-primary k_insertBtn"
						data-container="body" data-toggle="popover"
						data-placement="bottom" onclick="isLogin(this)"
						data-content="로그인이 필요한 기능 입니다.">질문 작성</button>
				</div>
			</div>
			<br>
			<div>
				<div class="all-questions-cnt">	
					<h4>총 ${pageMaker.totalCount}개의 질문</h4>
				</div>
				
				<div class="list-view-filter">
					<table>
						<tr>
							<td><a href="#" onclick="viewNewest()">최신 순</a></td>
							<td><a href="#" onclick="viewHit()">조회 순</a></td>
							<td><a href="#" onclick="viewRecommend()">추천 순</a></td>
						</tr>
					</table>
				</div>
			</div>
			
			<script>
			
				$(document).ready(function(){
					
					var length = '${fn:length(list)}' * 1;
					
					<c:forEach items="${list}" var="questionList" begin="0" end="${fn:length(list)}" varStatus="tag">
					
						var tags = '${questionList.q_tag}';
						var tagArr = tags.split("/");
						
						for(var i in tagArr){
							if(tagArr[i] != ''){
								$('.questions-tag-'+<c:out value="${tag.index}"/>).append('<div class="tag-box"><button type="button" onclick="moveTag(this.value)" class="btn btn-sm" value="'+ tagArr[i] +'">'+tagArr[i]+'</button></div>');
							}
						}
						
					</c:forEach>
					
				});
				
				function moveTag(tag){
					
					var tagValue = tag;
					
					location.href="${pageContext.request.contextPath}/search/tagged?tag="+tagValue;
					
				}
				
				// 최신 순 필터
				function viewNewest(){
		       		
	       			var filter="q_regdate";
	       		
	       			location.href="${pageContext.request.contextPath}/questions/questions?filter="+filter;
	       		
	       		}
				
				// 조회 순 필터
				function viewHit(){
		       		
	       			var filter="q_viewcnt";
	       		
	       			location.href="${pageContext.request.contextPath}/questions/questions?filter="+filter;
	       		
	       		}
				
				// 추천 순 필터
				function viewRecommend(){
		       		
	       			var filter="q_recommand";
	       		
	       			location.href="${pageContext.request.contextPath}/questions/questions?filter="+filter;
	       		
	       		}
	       		
	       		
			</script>
		</div>

		<div class="list-container">
			<c:if test="${empty list}">
				<div class="result-noList">
					<h2>질문이 없습니다.</h2>
				</div>
			</c:if>

			<c:if test="${!empty list}">
				<div class="result-List">
					<hr class="top-hr">
					<c:forEach var="questionList" items="${list}" begin="0" end="${fn:length(list)}" varStatus="num">
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
								<div class="row result-link">
									<h5>
										<a
											href="${pageContext.request.contextPath}/question/questionView?q_no=${questionList.q_no}">${questionList.q_title}</a>
									</h5>
								</div>
								<div class="questions-tag questions-tag-<c:out value="${num.index}"/> row">
								</div>
							</div>
							<!-- question-title 끝 -->
							<div class="col-lg-3 question-info">
								<a href="#">${questionList.user_nickname}</a>
								<div>${questionList.q_regdate}</div>
							</div>
						</div>
							<div class="col-lg-12"><hr class="bottom-hr"/></div>
						<!-- 게시글 row행 끝 -->
					</c:forEach>

					<br>
					<!-- 질문 글이 있을 시 페이징 표시 -->
					<div class="search-paging">
						<!-- view 단 페이징 모듈은 여기부터 -->
						<div class="text-center">
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/questions/questions${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="paging-item"
										<c:out value="${pageMaker.searchCri.page == idx?'class =active':''}"/>>
										<a class="page-link"
										href="${pageContext.request.contextPath}/questions/questions${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
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
	<!-- 질문 작성모달 -->
<div id="k_loginModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">로그인하기</h4>
      </div>
      <div class="modal-body">
        <p>질문등록은 로그인이 필요한 영역입니다.<br>로그인 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-info" onclick="k_loginPage()">로그인</button>
      </div>
    </div>

  </div>
</div>
	<script>
	function isLogin(data) {
		var session = '${loginInfo.user_no}';
		console.log(session);
		console.log(session == "");
		if (session == "") {
			$('#k_loginModal').modal();
		} else {
			$('[data-toggle="popover"]').prop("disabled", false);
			location.href = '${pageContext.request.contextPath}/question/insertQuestion';
		} 
	}
	function k_loginPage(){
		location.href = '${pageContext.request.contextPath}/userinfo/userlogin';
	}
</script>
	<!-- 주석 -->
	<jsp:include page="../common/layout_footer.jsp" />
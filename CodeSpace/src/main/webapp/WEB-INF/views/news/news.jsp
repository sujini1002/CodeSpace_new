<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->

	<div class="row">
		<div class="col-12">
			<p class="page-header" style="font-size: 48px; font-weight: 400; float: left;">News</p>
			<button class="btn btn-outline-info my-2 my-sm-0" id="newsWrite" type="button" style="float:right; margin-top: 30px;" 
			data-toggle="modal" data-target="#confirmPW" ><a href="${pageContext.request.contextPath}/news/register">등록하기</a></button>
		
			<!-- 글쓰기 버튼누르면 비밀번호 입력하게 -->
			<!-- <div class="modal fade" id="confirmPW" >
				<div class="modal-dialog">
					<div class="modal-content">
						header
						<div class="modal-header">
							header title
							<h4 class="modal-title">비밀번호 입력</h4>
							닫기(x) 버튼
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						body
						<div class="modal-body">
							공지사항을 쓰시겠습니까?<br> 
							공지사항은 관리자만 입력가능합니다.
							<br>공지사항 입력을 위해 비밀번호를 입력해주세요.
						</div>
						<form>
						<input type="password" style="margin-left: 20px;"></form>
						Footer
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="취소"> <input type="button" class="btn btn-danger"
								onclick="write_news()" value="입력하기">
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
	

	<div class="row">
		<div class="col-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover" style="background-color: white;">
						<thead>
							<tr>
								<th style="width: 50px">번호</th>
								<th style="width: 250px">제목</th>
								<th style="width: 70px">작성일</th>
								<th style="width: 70px">조회수</th>
							</tr>
						</thead>

						<c:forEach items="${list }" var="news">
							<tr>
								<td>${news.n_no }</td>
								<td><a href='${pageContext.request.contextPath}/news/newsView?n_no=<c:out value="${news.n_no}"/>'>${news.n_title }</a></td>
								<td>{news.n_regdate}</td>
								<td>${news.n_viewcnt}</td>
						</c:forEach>



					</table>
					<div class="search-paging">
						<!-- view 단 페이징 모듈은 여기부터 -->
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/news/news${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a class="page-link"
										href="${pageContext.request.contextPath}/news/news${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/news/news${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
								</c:if>
							</ul>
						

						</div>
						<!-- 여기 까지 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div>
		<button class type="submit" value="글쓰기"></button>
	</div> -->
<!-- <script>
function del_mypage() {
	location.href = "${pageContext.request.contextPath}/news/writeNews";
};

</script> -->











	<jsp:include page="../common/layout_footer.jsp" />
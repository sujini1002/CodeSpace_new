<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>


<!-- <style>
.ui-datepicker {
	background-color: white;
	z-index: 999;
	height: auto;
	font-size: 12px;
	border: 1px solid black;
	border-radius: 3px;
}

.ui-datepicker-title {
	text-align: center;
	line-height: inherit;
	font-size: 16px;
	font-weight: bold;
}

.ui-datepicker-next {
	padding-right: 10px;
	padding-top: 6px;
	float: right;
}

.ui-datepicker-prev {
	padding-left: 10px;
	padding-top: 6px;
	float: left;
}

.ui-datepicker ui-datepicker-month {
	font-size: 12px;
}

.ui-datepicker-calendar thead {
	font-size: 12px;
}

.ui-datepicker td span {
	font-size: 12px;
}

.ui-datepicker td a {
	font-size: 12px;
}
</style> -->
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!-- 여기부터 화면 코드 작성해주세요 -->

	<!-- 로그인한 사용자가 현재 참여중인 프로젝트 목록 보여줌 -->
	<c:if test="${userJoinProjects!=null }">
		<h5>${user_info.user_nickname }님의 프로젝트   
			<button type="button" class="btn btn-primary btn-sm"
				data-toggle="modal" data-target="#projectGenerate">프로젝트 생성하기</button>

		</h5>
		<br>
		<table class="table table-hover" >
			<thead >
				<tr class="row" >
					<th class="col-3">프로젝트 제목</th>
					<th class="col-3">프로젝트 내용</th>
					<th class="col-1">상태</th>
					<th class="col-2">시작일</th>
					<th class="col-2">종료일</th>
				</tr>
			</thead>
			<tbody >
				<c:forEach var="item" items="${userJoinProjects }" varStatus="status">
					<tr class="row" style="font-size: 15px;">
						<td class="col-3"><a
							href="${pageContext.request.contextPath}/project/prjdash?project_no=${item.project_no }
						&user_no=${loginInfo.user_no}">${item.project_title }</a></td>
						<td class="col-3">${item.project_content }</td>
						<td class="col-1"><c:if test="${item.project_status ==false}">
								<p style="color: red;">종료</p>
							</c:if> <c:if test="${item.project_status ==true}">
								<p style="color: blue;">진행중</p>
							</c:if></td>
						<td class="col-2">${item.prostring_startdate}</td>
						<td class="col-2">${item.prostring_enddate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 표시 -->
		<div class="search-paging">
			<!-- view 단 페이징 모듈은 여기부터 -->
			<div class="text-center">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/project/prjreg${pageMaker.makeQuery(pageMaker.startPage - 1)}&user_no=${user_info.user_no }">&laquo;</a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="paging-item"
							<c:out value="${pageMaker.searchCri.page == idx?'class =active':''}"/>>
							<a class="page-link"
							href="${pageContext.request.contextPath}/project/prjreg${pageMaker.makeQuery(idx)}&user_no=${user_info.user_no }">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/project/prjreg${pageMaker.makeQuery(pageMaker.endPage + 1)}&user_no=${user_info.user_no }">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			<!-- 여기 까지 -->
		</div>
		<!-- search-paging 끝 -->
	</c:if>
	<c:if test="${userJoinProjects==null }"> 
현재 참여중인 프로젝트가 없습니다.<br>
프로젝트를 진행해 보세요!
</c:if>























	<!-- 프로젝트 생성하기 모달 -->
	<div class="modal fade" id="projectGenerate">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">프로젝트 생성하기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/cos/project/prjreg" method="post" autocomplete=off>
					<!-- project_member db 저장을 위한 현재 로그인한 사용자 no 가져옴
		현재 로그인한 사용자가 프로젝트를 생성하므로, pm_no로 지정됨 -->
					<input type="hidden" name="pm_no" value="${user_info.user_no}">
					<input type="hidden" name="user_no" value="${user_info.user_no}">
					<!-- project Info 수정 -->
					<div class="modal-body">
						<!-- 프로젝트 제목 -->
						<div class="form-group">
							<label>프로젝트 제목</label> <input type="text" class="form-control"
								name="project_title" id="project_title"
								placeholder="프로젝트 명을 입력하세요" onkeyup="inputForm1()">
						</div>
						<!-- 프로젝트 설명 -->
						<div class="form-group">
							<label>프로젝트 설명</label> <input type="text" class="form-control"
								name="project_content" placeholder="프로젝트 설명을 입력하세요">
						</div>
						<!-- 종료 일정 -->
						<div class="form-group" id="inputDate">
							<label>종료 날짜</label> <input type="text" class="form-control"
								id="datepicker" name="prostring_enddate">
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->






	<jsp:include page="../common/layout_footer.jsp" />

	<!-- datepicker -->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
		$(function() {
			$('#datepicker').datepicker({
				container : '#inputDate',
				dateFormat : 'yy-mm-dd',
				minDate : 0
			});
		});

		//필수값 입력 안한 경우 프로젝트 생성하기 버튼 비활성
		function inputForm1() {

			if ($('#project_title').val() != "") {
				$('#proSubmit').attr('disabled', false);

			} else {
				$('#proSubmit').attr('disabled', true);
			}
		}
	</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!-- 여기부터 화면 코드 작성해주세요 -->

<!-- 로그인한 사용자가 현재 참여중인 프로젝트 목록 보여줌 -->
<c:if test="${userJoinProjects!=null }"> 
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">프로젝트 제목</th>
				<th scope="col">프로젝트 내용</th>
				<th scope="col">상태</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${userJoinProjects }" varStatus="status">
			<tr style="font-size:15px;">
				<td scope="row">${status.count }</td>
				<td><a href="${pageContext.request.contextPath}/project/prjdash?project_no=${item.project_no }
						&user_no=${loginInfo.user_no}">${item.project_title }</a></td>
				<td>${item.project_content }</td>
				<td>
					<c:if test="${item.project_status ==false}">
					<p style="color:red;">종료</p>
					</c:if>
					<c:if test="${item.project_status ==true}">
					<p style="color:blue;">진행중</p>
					</c:if>
				</td>
				<td>${item.project_startdate }</td>
				<td>${item.project_enddate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
<hr>
</c:if>



















<div>
	<h3>프로젝트 생성하기</h3>
	
	<!-- 프로젝트 생성하기 post방식으로  -->
	<!-- 제목 project_title/설명 project_content/참여자 project_member/종료일 project_project_enddate-->
	<form class="form-horizontal" id="proInfo" style="width:70%;" method="post">
		<div class="form-group">
			<label for="project_title">프로젝트 명</label> 
			<input type="text"
				class="form-control" name="project_title" id="project_title"
				placeholder="프로젝트 명을 입력하세요" onkeyup="inputForm1()">
		</div>
		<div class="form-group">
			<label for="project_content">프로젝트 설명</label> 
			<input type="text"
				class="form-control" name="project_content" placeholder="프로젝트 설명을 입력하세요">
		</div>
		<div class="form-group">
			<label for="prostring_enddate">프로젝트 종료일</label> 
			<input type="date" class="form-control" name="prostring_enddate" >
		</div>
		
		<!-- project_member db 저장을 위한 현재 로그인한 사용자 no 가져옴
		현재 로그인한 사용자가 프로젝트를 생성하므로, pm_no로 지정됨 -->
		<input type="hidden" name="pm_no" value="${user_info.user_no}">
		<input type="hidden" name="user_no" value="${user_info.user_no}">
		<button type="submit" class="btn btn-default" id="proSubmit" disabled="">만들기</button>
	</form>

</div>



<jsp:include page="../common/layout_footer.jsp" />

<script>

	//필수값 입력 안한 경우 프로젝트 생성하기 버튼 비활성
	function inputForm1(){
		
	 	if($('#project_title').val() != ""){
			$('#proSubmit').attr('disabled', false);
			
		} else {
			$('#proSubmit').attr('disabled', true);
		}
	}
	


</script>
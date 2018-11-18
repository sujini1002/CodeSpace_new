<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!-- 여기부터 화면 코드 작성해주세요 -->
<div>
	<h3>프로젝트 정보 수정하기</h3>

	<!-- 프로젝트 생성하기 post방식으로  -->
	<!-- 제목 project_title/설명 project_content/종료일 project_project_enddate-->
	
	<!-- 프로젝트 참가자는 추가 필요 -->

	<form method="post">
		<input type="hidden" name="user_no" value="${user_no }">
		<input type="text" name="project_no" value="${pro_info.project_no }" readonly> 
		<div class="form-group">
			<label for="project_title">프로젝트 명</label>
			<input type="text" class="form-control" 
				name="project_title" 
				value="${pro_info.project_title }">
		</div>
		<div class="form-group">
			<label for="project_content">프로젝트 설명</label>
			<input type="text" class="form-control"
				name="project_content" 
				value="${pro_info.project_content }">
		</div>

		<div class="form-group">
			<label for="prostring_enddate">프로젝트 종료일</label>
			<input type="date" class="form-control" 
				name="prostring_enddate" 
				value="${pro_info.prostring_enddate }">
		</div>

		<button type="submit" class="btn btn-default">정보 수정</button>
	</form>

</div>


<jsp:include page="../common/layout_footer.jsp" />
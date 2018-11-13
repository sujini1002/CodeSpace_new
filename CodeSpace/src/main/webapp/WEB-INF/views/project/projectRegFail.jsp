<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>


<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!-- 여기부터 화면 코드 작성해주세요 -->
	
	<h3>프로젝트는 '중수' 등급부터 만들 수 있습니다:></h3>
	<a href="${pageContext.request.contextPath }/question/insertQuestion">질문하러 가기</a>
<hr>
<div>
	<h3>to do list 테스트를 위한 project_no = 67 게시물</h3>
	<br>
	<h3>
		<a href="${pageContext.request.contextPath}/project/prjdash?project_no=${pro_info.project_no}&
			user_no=${user_info.user_no}">${pro_info.project_title }</a>
	</h3>

</div>


<jsp:include page="../common/layout_footer.jsp" />
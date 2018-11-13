<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>


<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp"/>
<!-- 여기부터 화면 코드 작성해주세요 -->

<h5>*참고: 로그인 user 정보: ${user_info.user_no} / ${user_info.user_id } / ${user_info.user_name }</h5>


<!-- 프로젝트 상세정보 표출 영역 -->
<div>
	<h3>${pro_info.project_title}  	
		<a class="btn btn-default" 
			href="${pageContext.request.contextPath }/project/projectUpdate?project_no=${pro_info.project_no }&user_no=${user_info.user_no}">수정하기</a></h3>
	<h5>${pro_info.project_content }</h5>
	<h5>Project Manager No: ${pro_info.pm_no}</h5>
</div>
<!-- 캘린더와 공지사항 표출 영역  -->
<table class='table' style="width:100%;" >
	<tr>
		<td>캘린더  <a href="#">더보기</a></td>
		<td>공지사항 <a href="#">더보기</a></td>
	</tr>
	<tr>
		<td><img src="${pageContext.request.contextPath}/resources/images/stop.jpg" width=300px></td>
		<td>
			<table class='table'>
				<tr>
					<td>no</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>1</td>
					<td>하이</td>
					<td>2018-01-01</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!-- to do list 표출영역 -->
<h3>to do list</h3>
<!-- var의 역할= for 문에서의 i  -->
<c:forEach var="tdl" items="${tdl_list }" varStatus="status">
	${status.count}. ${tdl.todolist_content} | ${tdl.todolist_status }<br>
</c:forEach>



<jsp:include page="/resources/common/layout_footer.jsp" />
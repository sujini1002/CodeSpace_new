<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Example row of columns -->
<div class="container" style="margin: 50px 0px 0px 35px;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="${pageContext.request.contextPath}/questions/questions">코드스페이스 <span class="sr-only">(current)</span></a></li>
					<li><a href="${pageContext.request.contextPath}/user/userList">사용자</a></li>
					<li><a href="${pageContext.request.contextPath}/project/prjreg?page=1&perPageNum=10&user_no=${loginInfo.user_no}">프로젝트</a></li>
					<li><a onclick="chatwindow()">채팅(미구현)</a></li>
					
					<%-- <c:if test="${!loginInfo.isEmpty() }">
						<li><a href="#">프로젝트</a></li>
					</c:if> --%>
					
				</ul>
			</div>

		</div>
		
	</div>
</div>
<script>
function chatwindow(){
	window.open("/cos/chatting/chattingWindow","채팅창","width=400, height=500, toolbar=no, menubar=no");
}
</script>
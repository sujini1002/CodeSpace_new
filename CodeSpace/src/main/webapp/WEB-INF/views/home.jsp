<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="common/layout_top.jsp" />
<jsp:include page="common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 70px;">



<!-- <button type="button" class="btn btn-primary k_insertBtn"
	onclick="isLogin()">질문 작성</button> -->
	
<button type="button"
	class="btn btn-default btn btn-primary k_insertBtn"
	data-container="body" data-toggle="popover" data-placement="bottom"
	onclick="isLogin(this)" data-content="로그인이 필요한 기능 입니다.">질문 작성</button>

<script>
	function isLogin(data) {

		var session = '${loginInfo.user_no}';
		console.log(session);
		console.log(session == "");
		if (session == "") {

			$(function() {
				$('button[data-toggle="popover"]').popover()
			});
			$('[data-toggle="popover"]').prop("disabled", true);
		} else {
			$('[data-toggle="popover"]').prop("disabled", false);
			location.href = '${pageContext.request.contextPath}/question/insertQuestion';

		}
	}
</script> <jsp:include page="common/layout_footer.jsp" />
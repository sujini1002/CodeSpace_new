<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="common/layout_top.jsp" />

<jsp:include page="common/homePhoto.jsp" />

<jsp:include page="common/layout_content.jsp"/> 

<button type="button" class="btn btn-primary k_insertBtn" onclick="isLogin()">질문 작성</button>

<script>
	function isLogin(){
		location.href='${pageContext.request.contextPath}/question/insertQuestion';
	}
</script>
<jsp:include page="common/layout_footer.jsp" />


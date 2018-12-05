<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->

<div>
	<table class="table col-12" style="background-color: white;">
		<thead>
			<th>${newsInfo.n_title }</th>
			<th>${newsInfo.n_regdate }</th>
		</thead>
		<tr>
			<td colspan="2">${newsInfo.n_content }</td>
		</tr>
		<%-- <tr>
			<td colspan="2">${newsInfo.n_photo }</td>
		</tr>
	 --%>
	</table>



</div>










	
<jsp:include page="../common/layout_footer.jsp" /> 

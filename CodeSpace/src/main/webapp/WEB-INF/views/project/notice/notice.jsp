<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../common/layout_top.jsp" />
<jsp:include page="../../common/layout_content.jsp" />

<!-- user_no/project_no/공지사항은 project 테이블에 pm_no에해당하는 사용자만 작성가능 -->
<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<table class="table table-striped h_noticeTable">
  <thead>
    <tr class="h_noticeTable">
      <th>공지사항 번호</th>
      <th>제목</th>
      <th>내용</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="projectNotice" items="${projectNotice }">
	  <tr>
	  	<td>${projectNotice.notice_no }</td>
	  	<td>${projectNotice.notice_title }</td>
	  	<td>${projectNotice.notice_content }</td>
	  	<td><button>수정</button></td>
	  	<td><button>삭제</button></td>
	  </tr>
  </c:forEach>
  </tbody>
</table>
<script>
</script>
<jsp:include page="../../common/layout_footer.jsp" />

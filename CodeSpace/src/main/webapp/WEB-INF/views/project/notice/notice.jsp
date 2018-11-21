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
      <th class="h_noticeno">공지사항 번호</th>
      <th>공지사항 제목</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="projectNotice" items="${projectNotice }">
	  <tr class="h_noticetr">
	  	<td class="h_noticeno">${projectNotice.notice_no }</td>
	  	<td><a class="h_noticetd" href="${pageContext.request.contextPath }/project/notice/detailnotice?notice_no=${projectNotice.notice_no }">${projectNotice.notice_title }</a></td>
	  </tr>
  </c:forEach>
  </tbody>
</table>
<h1>${loginInfo.user_no }</h1>
<div class="h_golist"><a href="#" style="color: black;" onclick="noticeWrite()">공지사항 작성</a></div>
<script>

/* 공지사항 작성 */
function noticeWrite(){
	var result = confirm('공지사항을 작성 하시겠습니까?');
	var user_no = '${loginInfo.user_no}';
	var pm_no = 0;
	var user_checkUrl= '${pageContext.request.contextPath}/project/notice/check';
	/* pm_no 와 user_no를 비교해 봐야 한다. */
	$.ajax({
		url:user_checkUrl,
		dataType:'JSON',
		data:{
			"user_no":user_no
		},
		success:function(response){
			console.log(response);
			if(response.pm_no==user_no && true){
				location.href='${pageContext.request.contextPath}/project/notice/write';
			}else if(response.pm_no==user_no){
				alert('프로젝트 매니저만 작성할 수 있습니다.');
			}
		}
	});
};
</script>
<jsp:include page="../../common/layout_footer.jsp" />

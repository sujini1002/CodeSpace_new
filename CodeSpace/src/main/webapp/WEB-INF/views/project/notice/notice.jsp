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
  <c:forEach var="projectNotice" items="${projectNotice.noticeList }">
	  <tr class="h_noticetr">
	  	<td class="h_noticeno">${projectNotice.notice_no }</td>
	  	<td><a class="h_noticetd" href="${pageContext.request.contextPath }/project/notice/detailnotice?notice_no=${projectNotice.notice_no }">${projectNotice.notice_title }</a></td>
	  </tr>
  </c:forEach>
  	<tr>
  		<td colspan="2" style="background-color: rgb(236,240,245); border-bottom: none;">
	  		<div class="search-paging">
				<ul class="pagination justify-content-center">
					<c:forEach var="num" begin="1" end="${projectNotice.pageTotalCnt }">
					<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/project/notice/notice?project_no=${project_no}&pageNum=${num}">${num }</a>
					</li>
				<%-- <a href="${pageContext.request.contextPath}/project/notice/notice?project_no=${project_no}&pageNum=${num}">[${num }]</a> --%>
					</c:forEach>
				</ul>
		</div>
		</td>
  	</tr>
  	<tr>
  	<td style="background-color: rgb(236,240,245); border-top:none; border-bottom: none;">
  	<div class="h_golist btn btn-outline-info btn-info" onclick="noticeWrite()">공지사항 작성</div>
  	</td>
  	</tr>
  </tbody>
</table>
<%-- <div style="border: 1px solid red;margin-left: -1%; width: 1200px;">
	<div style="width: 300px; margin: auto; border: 1px solid black">
		<c:forEach var="num" begin="1" end="${projectNotice.pageTotalCnt }">
			<a href="${pageContext.request.contextPath}/project/notice/notice?project_no=${project_no}&pageNum=${num}">[${num }]</a>
		</c:forEach>
	</div>
</div> --%>
<!-- <div class="h_golist btn btn-outline-info btn-info" onclick="noticeWrite()" style="margin-left: -1%;">공지사항 작성</div> -->
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
			if(response.pm_no == user_no && result == true){
				location.href='${pageContext.request.contextPath}/project/notice/write?project_no='+response.project_no;
			}else if(response.pm_no != user_no && result == false){
				alert('프로젝트 매니저만 작성할 수 있습니다.');
			}
		}
	});
};
</script>
<jsp:include page="../../common/layout_footer.jsp" />

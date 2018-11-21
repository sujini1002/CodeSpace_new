<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../../common/layout_top.jsp" />
<jsp:include page="../../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<div class="h_detailnotice">
		<div>
			<h1>${projectNotice.notice_title }
				<span>
					<a href="#" onclick="modifynotice()">수정</a>
					<a href="#" onclick="deletenotice()">삭제</a>
				</span>
			</h1>
			<p>${projectNotice.notice_content }</p>
		</div>
	</div>
	<div class="h_golist"><a href="${pageContext.request.contextPath }/project/notice/notice?project_no=${projectNotice.project_no}" style="color: black;">목록으로</a></div>
	<script>
	/* 공지사항 삭제 */
	function deletenotice(){
		var result = confirm('정말 삭제하시겠습니까?');
		var notice_no = '${projectNotice.notice_no }';
		var project_no = '${projectNotice.project_no }';
		if(result == true){
			location.href='${pageContext.request.contextPath }/project/notice/delete?notice_no=' + notice_no + '&project_no=' + project_no;
		}
	}
	/* 공지사항 수정 */
	function modifynotice(){
		var result = confirm('정말 수정하시겠습니까?');
		var notice_no = '${projectNotice.notice_no }';
		var project_no = '${projectNotice.project_no }';
		if(result == true){
			location.href= '${pageContext.request.contextPath }/project/notice/modify?notice_no=' + notice_no + '&project_no=' + project_no;
		}
	}
	
	</script>	
	<jsp:include page="../../common/layout_footer.jsp" />
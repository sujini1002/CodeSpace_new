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
			</h1>
				
			<!-- <div id="h_editor" name="notice_content">
			</div> -->
			<div id="hajiseung" hidden="hidden">${projectNotice.ops }</div>
			<div id="h_editor"><!-- hidden="hidden" --></div>
			<!-- <textarea id="h_textarea" rows="30" cols="200" ></textarea> -->
		</div>
	</div>
	<span>
		<a href="#" class="btn btn-outline-info btn-info" onclick="modifynotice()" style="margin-top: 5px;">수정</a>
		<a href="#" class="btn btn-outline-info btn-info" onclick="deletenotice()" style="margin-top: 5px;">삭제</a>
	</span>
	<span class="h_golist"><a href="${pageContext.request.contextPath }/project/notice/notice?project_no=${projectNotice.project_no}" class="btn btn-outline-info btn-info" style="margin-top: 5px;">목록으로</a></span>
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
	$(document).ready(function(){
	var toolbarOptions = [
				['bold','italic','underline','strike'],
				['blockquote','code-block'],
				[{'header':1},{'header':2}],
				[{'list':'ordered'},{'list':'bullet'}],
				[{'script':'sub'},{'script':'super'}],
				[{'indent':'-1'},{'indent':'+1'}],
				[{'direction':'rtl'}],
				[{'size':['small',false,'large','huge']}],
				['link','image','video','formula'],
				[{'color':[]},{'background':[]}],
				[{'font':[]}],
				[{'align':[]}]
			];
		
		var	quill = new Quill('#h_editor',{
			modules:{
				toolbar:toolbarOptions
			},
			theme:'bubble'
		});
		
		var textdata = $('#hajiseung')[0].innerText;
		textdata = JSON.parse(textdata);

		quill.enable(false);
		quill.setContents(textdata);
	});
	</script>	
	<jsp:include page="../../common/layout_footer.jsp" />
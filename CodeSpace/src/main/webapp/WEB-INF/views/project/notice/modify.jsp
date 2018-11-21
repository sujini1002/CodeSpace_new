<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../../common/layout_top.jsp" />
<jsp:include page="../../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->

<div id="h_toolbar">${projectNotice.notice_title }</div>
<div id="h_editor">${projectNotice.notice_content }</div>
<button id="h_saveDelta">h_saveDelta</button>




<script>
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
		theme:'snow'
	});
	
	$('#h_saveDelta').click(function(){
		var delta = quill.getContents();
		console.log(delta);
	});
</script>
	
<jsp:include page="../../common/layout_footer.jsp" />

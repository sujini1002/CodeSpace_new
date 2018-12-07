<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../../common/layout_top.jsp" />
<jsp:include page="../../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<!-- <form action="#" method="post"> -->
	<!-- <div id="h_toolbar" name="notice_title">111</div> -->
	<div id="h_wrapper">
		<!-- <div id="h_toolbar" name="notice_title"> --><input type="text" placeholder="제목을 입력해주세요"/><!-- </div> -->
		<div id="h_editor" name="notice_content"></div>
		<div id="h_saveDelta" class="btn btn-outline-info btn-info" style="margin-top: 10px;">공지사항 작성</div>
	</div>
<!-- </form> -->



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
	
	$('#h_saveDelta').click(function(data){
		var delta = quill.getContents();
		var ops = JSON.stringify(delta);
		$.post('#',
				{
				"project_no":"${project_no}",
				"notice_title":$('#h_wrapper>input').val(),
				"notice_content":$('#h_editor')[0].innerText,
				"ops":ops
				},
				function(data,status){
					if(status == 'success'){
						location.href='${pageContext.request.contextPath}/project/notice/notice?project_no='+${project_no};
					}
				});
	});
</script>
	
<jsp:include page="../../common/layout_footer.jsp" />

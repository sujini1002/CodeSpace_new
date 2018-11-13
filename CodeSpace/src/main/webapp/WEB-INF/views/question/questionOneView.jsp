<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp"/>

<table border="1" style="width:100%">
	<!-- 타이틀 -->
	<tr>
		<td colspan="2" style="text-align: center">
			<h3>${questionInfo.q_title}</h3>
			<hr>
		</td>
	</tr>
	<!-- 태그 -->
	<tr>
		<td colspan="2" style="height:70px">
			<button type="button" class="btn">${questionInfo.q_tag}</button>
		</td>
	</tr>
	<tr>
		<!-- 추천 & 즐겨 찾기 -->
		<td rowspan="3" style="width:15%; text-align:center; vertical-align:middle">
			<div id="k_recommand" >
				<button type="button" class="btn" style="background-color:white">
					<i class="fa fa-chevron-up fa-2x" style="color: gray;"></i>
				</button>
				<h3>${questionInfo.q_recommand}</h3>
				<button type="button" class="btn" style="background-color:white">
					<i class="fa fa-chevron-down fa-2x" style="color: gray;"></i>
				</button>
			</div>
			<div id="k_bookmark" style="margin-top:10px">
				<button type="button" class="btn" style="background-color:white">
					<i class="fa fa-star fa-2x" style="color: gray;"></i>
				</button>
			</div>
		</td>
		
		<!-- 질문내용 -->
		<td>
			<div id="toolbar" ></div> 
			<div id="editor">
				<textarea rows="50" cols="50"  id="k_questionText" style="display:none">
				${questionInfo.q_content}
				</textarea>
				
			</div>
			<%-- <div id="k_regdate" style="float:right"><p>${questionInfo.q_regdate}</p></div> --%>
			
				<script>
					console.log($('#k_questionText').val());
					var delta = JSON.parse($('#k_questionText').val());
					
					console.log(delta);
					//console.log(delta);
					console.log(typeof delta);

					 var toolbarOptions = [
						 ['bold','italic','underline','strike'],
							['blockquote','code-block'],
							[{'header':[1,2,3,4,5,6,false]}],
							[{'list':'ordered'},{'list':'bullet'}],
							[{'script':'sub'},{'script':'super'}],
							[{'indent':'-1'},{'indent':'+1'}],
							[{'direction' :'rtl'}],
							['link','image','formula'],
							[{'color':[]},{'background':[]}],
							[{'font':[]}],
							[{'align':[]}]
						 ];

					var quill = new Quill('#editor', {
						modules : {
							toolbar: toolbarOptions
						},
						theme : 'snow'
					});

					$('.ql-toolbar').css('visibility', 'hidden');
					$('#editor').css('border', 'none');
					quill.setContents(delta);
					quill.enable(false);
				</script>
		</td>
	</tr>
	<tr>
		<!-- 작성자 -->
		<td style="width:85%">
			<!-- 인클루드 하기 -->
		</td>
	</tr>
	<tr>
		<!-- 댓글 -->
		<td style="width:85%">
			<!-- 인클루드 하기 -->
		</td>
	</tr>
</table>


<jsp:include page="../common/layout_footer.jsp" />
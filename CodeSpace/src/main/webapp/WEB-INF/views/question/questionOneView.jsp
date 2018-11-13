<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/layout_top.jsp" />
<jsp:include page="/resources/common/layout_content.jsp"/>

<table>
	<table>
	
	
	<tr>
		<td>
			<h2>${questionInfo.q_title}</h2>
		</td>
	</tr>
	<tr>
		<td>
			 
			
			<div id="toolbar" ></div> 
			<div id="editor">
				<textarea rows="50" cols="50"  id="k_questionText">
				${questionInfo.q_content}
				</textarea>
			</div>
			
				<script>
				
				
					var delta = JSON.parse($('#k_questionText').val());
					console.log(delta);
					console.log(typeof delta);

					 var toolbarOptions = [
							[ 'bold', 'italic', 'underline', 'strike' ],
							[ 'blockquote', 'code-block' ], [ {
								'header' : [ 1, 2, 3, 4, 5, 6, false ]
							} ], [ {
								'list' : 'ordered'
							}, {
								'list' : 'bullet'
							} ], [ {
								'script' : 'sub'
							}, {
								'script' : 'super'
							} ], [ {
								'indent' : '-1'
							}, {
								'indent' : '+1'
							} ], [ {
								'direction' : 'rtl'
							} ], [ 'link', 'image', 'formula' ], [ {
								'color' : []
							}, {
								'background' : []
							} ], [ {
								'font' : []
							} ], [ {
								'align' : []
							} ] ];

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
		<td>
			${questionInfo.q_tag}
		</td>
	</tr>

	

</table>
</table>


<jsp:include page="/resources/common/layout_footer.jsp" />
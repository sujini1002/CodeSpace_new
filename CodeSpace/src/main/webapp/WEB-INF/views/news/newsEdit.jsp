<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- SummerNote 에디터 관련 -->
<!-- Summernote Editor libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- SummerNote 에디터 관련 끝 -->

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<button class="btn btn-outline-info my-2 my-sm-0" id="newslist"
		type="button" style="float: right;">
		<a href="${pageContext.request.contextPath}/news/news"
			style="text-decoration: none;">목록보기</a>
	</button>


	<form id="summerFormEdit" method="post">
		<input type="text" name="n_title" class="form-control" value="${newsInfo.n_title}"> 
		<input type="hidden" name="n_writer" value="${newsInfo.n_writer}">
		<textarea id="summernote" name="n_content">${newsInfo.n_content}</textarea>
		<div align="center">
			<button type="submit" class="btn btn-info">작성하기</button>
		</div>
	</form>



	<script>
		$(document)
				.ready(
						function() {
							/* summernote에서 이미지 업로드시 실행할 함수 */
							function sendFile(file, editor) {
								// 파일 전송을 위한 폼생성
								data = new FormData();
								data.append("uploadFile", file);
								$
										.ajax({ // ajax를 통해 파일 업로드 처리
											data : data,
											type : "POST",
											url : "./summernote_imageUpload.jsp",
											cache : false,
											contentType : false,
											processData : false,
											success : function(data) { // 처리가 성공할 경우
												// 에디터에 이미지 출력
												$(editor).summernote(
														'editor.insertImage',
														data.url);
											}
										});
							}

							/* 서머노트 선언 */
							$('#summernote').summernote({
								placeholder : '',
								tabsize : 5,
								height : 300
							});

							/* 에디터 설정 */
							$('#summernote').summernote(
									{
										height : 300,
										minHeight : null,
										maxHeight : null,
										focus : true,
										collback : {
											onImageUpload : function(files,
													editor, welEditable) {
												sendFile(files[0], this);
											}
										}
									});

							/* 툴바 설정 */
							$('#summernote')
									.summernote(
											{
												toolbar : [
														// [groupName, [list of button]]
														[
																'style',
																[
																		'bold',
																		'italic',
																		'underline',
																		'clear' ] ],
														[
																'font',
																[
																		'strikethrough',
																		'superscript',
																		'subscript' ] ],
														[ 'fontsize',
																[ 'fontsize' ] ],
														[ 'color', [ 'color' ] ],
														[
																'para',
																[ 'ul', 'ol',
																		'paragraph' ] ],
														[ 'height',
																[ 'height' ] ] ]
											});

							var summerForm = function() {

								var contents = $('textarea[name="n_content"]')
										.html($('#summernote').code());

							}
						});
	</script>





</div>











<jsp:include page="../common/layout_footer.jsp" />

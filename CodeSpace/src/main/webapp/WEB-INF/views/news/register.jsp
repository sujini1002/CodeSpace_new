<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
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
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->



<h1>글 작성하기</h1>
<hr>

<!-- <form method="post">
	<textarea id="summernote" name="editordata" rows="" cols=""></textarea>
</form> -->
<div id="summernote">Hello! CodeSpace</div>
 <script>
 	  /* 서머노트 선언 */
      $('#summernote').summernote({
        placeholder: 'Hello bootstrap 4',
        tabsize: 5,
        height: 300
      });
 	  /* 에디터 설정 */
      $('#summernote').summernote({
    	  height: 300,                 
    	  minHeight: null,             
    	  maxHeight: null,             
    	  focus: true                  
    	});
 	  
 	  /* 툴바 설정 */
      $('#summernote').summernote({
    	  toolbar: [
    	    // [groupName, [list of button]]
    	    ['style', ['bold', 'italic', 'underline', 'clear']],
    	    ['font', ['strikethrough', 'superscript', 'subscript']],
    	    ['fontsize', ['fontsize']],
    	    ['color', ['color']],
    	    ['para', ['ul', 'ol', 'paragraph']],
    	    ['height', ['height']]
    	  ]
    	});
 	  
</script>


<a type="button" class="btn btn-primary" onclick="">작성하기</a>





	
<jsp:include page="../common/layout_footer.jsp" /> 

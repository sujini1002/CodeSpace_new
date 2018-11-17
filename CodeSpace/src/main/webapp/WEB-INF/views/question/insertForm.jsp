<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<table class="k_table">
	
	<tr>
		<td><h2>질문 작성</h2></td>
	</tr>
	
	<tr>
		<td>
			<input type="text" name="q_title"  id="q_title" placeholder="제목을 입력해 주세요"  class="form-control" required/>
			<input type="hidden" name="user_no" id="user_no" value="${loginInfo.user_no}">
			<input type="hidden" name="user_nickname" id="user_nickname" value="${loginInfo.user_nickname}">
		</td>
	</tr>
	<tr>
		<td>
			<!-- <div id="toolbar"></div> -->
			<div id="editor" style="height: 500px"></div>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="q_tag"  id="q_tag" placeholder="태그를 입력해 주세요"  class="form-control" required/>
		</td>
	</tr>
	<tr>
		<td>
			<button id="k_save" class="btn btn-primary">등록하기</button>
		</td>
	</tr>

	

</table>
<script>
	
	var toolbarOptions =[
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

	var quill = new Quill('#editor',{
		modules :{
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
	
	
	$('#k_save').click(function(){
		var title = $('#q_title').val();
		var user_no = $('#user_no').val();
		var content = JSON.stringify(quill.getContents());
		var tag = $('#q_tag').val();
		var nickname=$('#user_nickname').val();
		//테스트
		/* console.log(title);
		console.log(user_no);
		console.log(content);
		console.log(typeof content);
		console.log(tag);  */
		$.ajax({
			url:'${pageContext.request.contextPath}/question/insertQuestion',
			type:'POST',
			data:{
				"q_title":title,
				"user_no":user_no,
				"q_content":content,
				"q_tag":tag,
				"user_nickname":nickname
			},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			success:function(data){
				location.href='${pageContext.request.contextPath}/question/questionView?q_no='+data.q_no;
			},
			error:function(){
				alert('불행하게도 에러입니다 ㅠㅠ');
			}
		}); 
	});
</script>
<jsp:include page="../common/layout_footer.jsp" />
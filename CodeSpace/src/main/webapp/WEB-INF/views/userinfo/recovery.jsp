<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<div class="row justify-content-center" style="text-align: center;">
	<div class="col-md-3 h_divcont">
		<div>가입시 사용했던 이메일을 입력 해주세요.</div>
		<div><input type="text" class="form-control" id="h_checkId" placeholder="E-Mail을 입력하세요"  autofocus="autofocus"/></div>
		<div><a href="#" class="btn btn-lg btn-primary btn-block" onclick="check()">확인 메일 보내기</a></div>
	</div>
</div>
<script>
/* 이메일이 우리 DB에 있나 체크 */
function check(){
	/* var h_checkId=$('#h_checkId'); */
	var user_id = $('#h_checkId').val();
	var url='${pageContext.request.contextPath}/userinfo/useridcheck';
	var reUrl='${pageContext.request.contextPath}/userinfo/recovery';

	$.ajax({
		url:url,
		type:'post',
		dataType:'json',
		data:{
			"user_id":user_id
		},
		success:function(response){
			if(response.user_id != null){
				/* 이메일이 일치하면 등록 된 이메일로 패스워드 새로 설정 할 수 있는 이메일 보내준다. */
				$.ajax({
					url:reUrl,
					type:'post',
					data:{
						"user_id":response.user_id
					},
					success:function(response){
						if(response == 1){
							alert('메일 확인 부탁 드립니다!!');
							location.href='${pageContext.request.contextPath}/';
						}
					}
				});/* end of innerAjax */
			}else{
				alert('등록되지 않은 E-Mail입니다. 다시 확인 부탁드립니다.');
			}/* end of if-else */
		}/* end of success */		
	});/* end of outerAjax */
}

</script>	
<jsp:include page="../common/layout_footer.jsp" />

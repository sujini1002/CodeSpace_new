<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<%-- <div style="text-align: center;">
	<input type="text" hidden="hidden" class="user_id" name="user_id" value="${userInfoVo.user_id}"/>
	<input type="password" placeholder="비밀번호 입력" class="user_pw" name="user_pw" style="margin: auto; display: block;" />
	<input type="password" placeholder="비밀번호 확인" class="reCheck_pw" style="margin: auto; display: block;"/>
	<a href="#" onclick="changePw()">비밀 번호 변경</a>
</div> --%>
<div class="row justify-content-center h_loginForm">
	<div class="col-md-12 h_loginForm2">
	    <input type="text" hidden="hidden" class="user_id" name="user_id" value="${userInfoVo.user_id}"/>
	    <input type="password" placeholder="비밀번호 입력" class="form-control user_pw" name="user_pw" style="margin-bottom: -1px; border-radius: 5px; border-bottom-left-radius: 0px;border-bottom-right-radius: 0px;" autofocus/>
	    <input type="password" placeholder="비밀번호 확인" class="form-control reCheck_pw"/>
	    <a href="#"  class="btn btn-lg btn-primary btn-block" onclick="changePw()">비밀 번호 변경</a>
	</div>
</div>
<script>
function changePw(){
	var data =[$('.user_pw'),$('.reCheck_pw')];
	var idData = $('.user_id');
	var user_id = idData.val();
	var user_pw = data[0].val();
	var reCheck_pw = data[1].val();
	var url = '${pageContext.request.contextPath}/userinfo/changepw';
	
	if(user_pw != '' && user_pw === reCheck_pw){
		$.ajax({
			url:url,
			type:'post',
			data:{
				"user_id":user_id,
				"user_pw":user_pw
			},
			success:function(response){
				if(response=='success'){
					location.href='${pageContext.request.contextPath}/userinfo/userlogin';
				}
			}
		});
	}else{
		alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
		$('.user_pw').text('');
		$('.reCheck_pw').text('');
	}
}


</script>
<jsp:include page="../common/layout_footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<div class="row justify-content-center h_loginForm">
		<div class="col-md-12 h_loginForm2">
		    <label for="inputEmail" class="sr-only">Email address</label>
		    <input type="text" id="inputEmail" class="form-control user_id" name="user_id" placeholder="E-Mail을 입력하세요" required autofocus>
		    <label for="inputPassword" class="sr-only">Password</label>
		    <input type="password" id="inputPassword" class="form-control user_pw" name="user_pw" placeholder="비밀번호를 입력 하세요" required>
		    <div class="checkPlz" style="display: inline;"></div>
		    <div class="checkbox mb-3">
		        <label>
		          <input type="checkbox" value="remember-me" class="remember_id"> E-Mail 저장
		        </label>
	      	</div>
		    <button class="btn btn-lg btn-primary btn-block" onclick="loginCheck()">로그인</button>
		    <button class="g-signin2 h_login h_loginpage" data-onsuccess="onSignIn" style="width:300.5px;height: 45px;"></button>
		    <a href="#" onclick="forgotPW()" style="float: right; margin-top: 3px; color: darkgray;">forgot P/W?</a>
     	</div>
     </div>
     
<script>
$(function(){
	var checkcookie = '${cookie.user_id.value}';
	if(checkcookie!=null){
		$('.user_id').val(checkcookie);
		$('.remember_id').attr('checked',true);
	}
});

function loginCheck(){
	var url = '${pageContext.request.contextPath}/userinfo/userlogin';
	var user_id = $('.user_id');
	var user_pw = $('.user_pw');
	var user_cookie = $('.remember_id')[0].checked;
	
	$.ajax({
		url:url,
		dataType:"JSON",
		type:"post",
		data:{
			"user_id":user_id.val(),
			"user_pw":user_pw.val(),
			"user_cookie":user_cookie
		},
		success:function(response){
			if(response == 1){
				$('.checkPlz').text('구글로 가입한 유저입니다. 구글 로그인으로 진행 부탁드립니다.').css('color','red');
			}else if(response == 2){
				location.href="${pageContext.request.contextPath}/";
			}else if(response ==3){
				$('.checkPlz').text('없는 사용자 입니다. 회원가입을 부탁드립니다.').css('color','red');
			}
			else{
				$('.checkPlz').text('E-mail 혹은 비밀번호 오류입니다 다시 확인해주세요.').css('color','red');
			}
		}
	});
}
function forgotPW(){
	location.href='${pageContext.request.contextPath}/userinfo/recovery';
}
</script>
<jsp:include page="../common/layout_footer.jsp" />
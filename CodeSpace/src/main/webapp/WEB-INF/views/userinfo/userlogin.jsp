<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	<!-- <div class="h_loginPage">
		<input type="text" placeholder="E-Mail을 입력하세요" name="user_id" class="user_id"/><br>
		<input type="password" placeholder="비밀번호를 입력 하세요" name="user_pw" class="user_pw"/><br>
		<div class="checkPlz"></div>
		<button onclick="loginCheck()">로그인</button>
	</div> -->
	<div class="h_loginForm">
		<div class="h_loginForm2">
		    <label for="inputEmail" class="sr-only">Email address</label>
		    <input type="text" id="inputEmail" class="form-control user_id" name="user_id" placeholder="E-Mail을 입력하세요" required autofocus>
		    <label for="inputPassword" class="sr-only">Password</label>
		    <input type="password" id="inputPassword" class="form-control user_pw" name="user_pw" placeholder="비밀번호를 입력 하세요" required>
		    <button class="btn btn-lg btn-primary btn-block" onclick="loginCheck()">로그인</button>
     	</div>
     </div>
<script>
function loginCheck(){
	var url = '${pageContext.request.contextPath}/userinfo/userlogin';
	var user_id = $('.user_id');
	var user_pw = $('.user_pw');
	
	$.ajax({
		url:url,
		dataType:"JSON",
		type:"post",
		data:{
			"user_id":user_id.val(),
			"user_pw":user_pw.val()
		},
		success:function(response){
			if(response == 1){
				$('.checkPlz').text('구글로 가입한 유저입니다 구글 로그인으로 진행 부탁드립니다.').css('color','red');
			}else if(response == 2){
		/* 		var check = ${loginInfo};
				alert(check);
				console.log(check); */
				location.href="${pageContext.request.contextPath}/";
			}else{
				$('.checkPlz').text('E-mail 혹은 비밀번호 오류입니다 다시 확인해주세요.').css('color','red');
			}
		}
	});
}

</script>
<jsp:include page="../common/layout_footer.jsp" />
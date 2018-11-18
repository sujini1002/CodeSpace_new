<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<form method="post" enctype="multipart/form-data">
	 	<div class="form-group h_group">
            <label for="exampleInputEmail1">이메일 주소</label>
            <c:if test="${empty googlecheck}">
                <input type="text" class="form-control h_id" placeholder="이메일을 입력하세요" name="user_id" checked="checked"/>
                <div class="h_check"></div>
                
                <label for="password">비밀번호</label>
                <input type="password" class="form-control h_pw" placeholder="비밀번호를 입력하세요" name="user_pw" />
                <div class="h_checkpw"></div>
            </c:if>
            <c:if test="${!empty googlecheck}">
                <input type="text" class="form-control h_id" name="user_id" value="${googlecheck}" readonly="readonly" />
            </c:if>
        </div>
        
        <div class="form-group h_group">
            <label for="name">이름</label>
            <input type="text" class="form-control h_name" placeholder="이름을 입력 하세요" name="user_name">
            <div class="h_checkname"></div>
        </div>
        
        <div class="form-group h_group">
            <label for="nickname">별명</label>
            <input type="text" class="form-control h_nickname" placeholder="별명을 입력 하세요" name="user_nickname">
        </div>
        
        <div class="form-group h_group">
            <label for="homepage">개인 홈페이지</label>
            <input type="text" class="form-control h_url" placeholder="URL을 입력 하세요" name="user_url">
        </div>
        
        <div class="form-group h_group">
            <label for="tag">Tag</label>
            <input type="text" class="form-control h_tag" placeholder="Tag를 입력하세요" name="user_tag">
        </div>
        
        <div class="form-group h_group">
            <label for="intro">자기 소개</label>
            <textarea class="form-control h_intro" rows="3" name="user_intro"></textarea>
        </div>
        
        <div class="form-group h_group">
            <label for="photo">프로필 사진</label>
            <input type="file" class="h_photo" name="photo">
            <!-- <p class="help-block">여기에 블록레벨 도움말 예제</p> -->
        </div>
        
        <div>
        	<input class="regbutton" disabled="disabled" type="submit" value="회원가입">
        </div>
</form>
<script>
/* $(function(){}) 와 같다*/
/* 정규식으로 아이디 적합테스트 */
$(document).ready(function(){
	var checkemail = false;
	var checkname = false;
	var checkpw = false;
	
	var pattern = '^[a-zA-Z0-9][a-zA-Z0-9\.\_\-]{4,16}@[a-zA-Z0-9]+\.[a-zA-Z]{2,8}$';
	/* id 적합성 체크 */
	$('.h_id').focusout(function(){
		var data = $('.h_id');
		var matchid = data.val().match(pattern); 
		if(!matchid){
			$('.h_check').text('잘못된 이메일 형식입니다. 4~16자 사이의 아이디를 입력해주세요!').css('color','red');
				if(data.val()==''){				
					$('.h_check').text('필수 정보 입니다!!').css('color','red');
				}
					checkemail = false;
					buttonstatus();
		}else if(matchid){
			$.ajax({
				url:'${pageContext.request.contextPath}/userinfo/useridcheck',
				type:'post',
				data:{
					'user_id':data.val()
				},
				success:function(response){
					if(response==''){
						$('.h_check').text('멋진 Email이네요!!').css('color','green');
						checkemail = true;
						buttonstatus();
					}else{
						$('.h_check').text('이미 사용중인 Email입니다...').css('color','red');
						checkemail = false;
						buttonstatus();
					}
				}
			});
		}
	});
	
	/* 비밀번호 공백 체크 */
	$('.h_pw').focusout(function(){
		var data = $('.h_pw');
		if(data.val()==''){
			$('.h_checkpw').text('필수 정보 입니다!!').css('color','red');
			checkpw = false;
			buttonstatus();
		}else{
			$('.h_checkpw').text('');
			checkpw = true;
			buttonstatus();
		}
	});
	
	/* 이름 공백 체크 */
	$('.h_name').focusout(function(){
		var data = $('.h_name');
		if(data.val()==''){
			$('.h_checkname').text('필수 정보 입니다!!').css('color','red');
			checkname = false;
			buttonstatus();
		}else{
			$('.h_checkname').text('');
			checkname = true;
			buttonstatus();
		}
	});
	
	/* 회원 필수 정보 유무 확인 */
	function buttonstatus(){
		if(checkemail == true && checkpw == true && checkname == true){
			$('.regbutton').removeAttr('disabled');
		}else{
			$('.regbutton').attr('disabled','disabled');
		}
	}
});
</script>
<jsp:include page="../common/layout_footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->
<form id="photoform" method="post" enctype="multipart/form-data">
	 	<div class="form-group h_group">
            <label for="exampleInputEmail1" style="margin: auto;">이메일 주소</label>
            <c:if test="${empty googlecheck}">
                <input type="text" class="form-control h_id" placeholder="이메일을 입력하세요" name="user_id" checked="checked" style="width: 300px;"/>
                <div class="h_check" style="width: auto;"></div>

                <label for="password">비밀번호</label>
                <input type="password" class="form-control h_pw" placeholder="비밀번호를 입력하세요" name="user_pw" style="width: 300px;"/>
                <div class="h_checkpw"></div>
                
                <label for="password">비밀번호 체크</label>
                <input type="password" class="form-control h_pwCheck" placeholder="비밀번호를 다시 입력하세요" style="width: 300px;"/>
                <div class="h_recheckpw"></div>
            </c:if>
            
            <c:if test="${!empty googlecheck}">
                <input type="text" class="form-control h_id" name="user_id" value="${googlecheck}" style="width: 300px;" readonly="readonly" />
                
                <input type="password" class="form-control ha_pw" value="null" name="user_pw" hidden="hidden"/>
            </c:if>
        </div>
        
        <div class="form-group h_group">
            <label for="name">이름</label>
            <input type="text" class="form-control h_name" placeholder="이름을 입력 하세요" name="user_name" style="width: 300px;">
            <div class="h_checkname"></div>
        </div>
 
        <div class="form-group h_group">
            <label for="nickname">별명</label>
            <input type="text" class="form-control h_nickname" placeholder="별명을 입력 하세요" name="user_nickname" style="width: 300px;">
        </div>
        
        <div class="form-group h_group">
            <label for="homepage">개인 홈페이지</label>
            <input type="text" class="form-control h_url" placeholder="URL을 입력 하세요" name="user_url" style="width: 300px;">
        </div>
        
        <div class="form-group h_group">
            <label for="tag">Tag</label>
            <ul id="k_joinTags">
					
			</ul>
        </div>
        
        <div class="form-group h_group">
            <label for="intro">자기 소개</label>
            <textarea class="form-control h_intro" rows="3" name="user_intro" style="width: 300px;"></textarea>
        </div>
        
        <div class="form-group h_group">
            <label for="photo">프로필 사진</label>
            <input type="file" class="h_photo" name="photo">
            <!-- <p class="help-block">여기에 블록레벨 도움말 예제</p> -->
        </div>
</form>
        <div>
        	<button type="submit" class="regbutton btn btn-lg btn-primary btn-block" disabled="disabled" style="width: 300px;" onclick="regUser()">회원가입</button>
        	<!-- <input class="regbutton" disabled="disabled" type="submit" value="회원가입"> -->
        </div>
<script>
/* $(function(){}) 와 같다*/
/* 정규식으로 아이디 적합테스트 */
$(document).ready(function(){
	var checkemail = false;
	var checkname = false;
	var checkpw = false;
	var recheckpw = false;
	
	var pattern = '^[a-zA-Z0-9][a-zA-Z0-9\.\_\-]{3,16}@[a-zA-Z0-9]+\.[a-zA-Z]{2,8}$';//아이디 정규식
	var patternPw ='^[a-zA-Z0-9#?!@$%^&*-]{4,10}$';//비밀번호 정규식
	/* id 적합성 체크 */
	if(<c:out value='${empty googlecheck}'/>){
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
			}else{
				$.ajax({
					url:'${pageContext.request.contextPath}/userinfo/useridcheck',
					type:'post',
					dataType:'json',
					data:{
						'user_id':data.val()
					},
					success:function(response){
						if(response.user_no==0){
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
	}else{
		checkemail = true;
		buttonstatus();
	}
	/* 비밀번호 공백 체크 */
	if(<c:out value='${empty googlecheck }'/>){
		$('.h_pw').focusout(function(){
			var data = $('.h_pw').val();
			var matchPw = data.match(patternPw); 
				if(!matchPw){
					$('.h_checkpw').text('4~10글자 사이의 비밀번호를 입력하세요').css('color','red');
					if(data==''){
						$('.h_checkpw').text('필수 정보 입니다.4~10글자 사이의 비밀번호를 입력하세요').css('color','red');
					}
					checkpw = false;
					buttonstatus();
				}else{
					$('.h_checkpw').text('');
					checkpw = true;
					buttonstatus();
				}
		});
	}else{
		checkpw = true;
		recheckpw = true;
		buttonstatus();
	}
	
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
	/* 비밀번호 다시 체크 */
	$('.h_pwCheck').focusout(function(){
		var pw = $('.h_pw').val();
		var pwCk = $('.h_pwCheck').val();
		
		if(pw == pwCk && checkpw == true){
			$('.h_recheckpw').text('비밀번호가 일치합니다!').css('color','green');
			recheckpw = true;
			buttonstatus();
		}else{
			$('.h_recheckpw').text('비밀번호를 다시 확인해주세요!').css('color','red');
			$('.h_pwCheck')[0].value = '';
			recheckpw = false;
			buttonstatus();
		}
	});
	
	/* 회원 필수 정보 유무 확인 */
	function buttonstatus(){
		if(checkemail == true && checkpw == true && checkname == true && recheckpw == true){
			$('.regbutton').removeAttr('disabled');
		}else{
			$('.regbutton').attr('disabled','disabled');
		}
	}
	 $("#k_joinTags").tagit();
});
	/* 다른 URL로 사진 보내기 및 회원가입 */
	function regUser(){
		var ddata = $('.h_photo').val();
		var regbutton = $('.regbutton').attr('disabled');
		var url = '${pageContext.request.contextPath}/userinfo/userreg';
		
		var tag = '';
		$('input[name=tags]').each(function(i){
			tag += '/'+$('input[name="tags"]')[i].value; 
		});

		/* 사진 있을때 */
		if(regbutton == null && ddata != ''){
			var form = $('#photoform')[0];
			var formData = new FormData(form);
			
			$.ajax({
				url:'http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/savePic',
				/* url:'http://localhost:8080/cospic/savePic', */
				dataType:'JSON',
				type:'POST',
				data:formData,
			    processData : false,
	            contentType : false,
	            success:function(result){
	            	$.ajax({
           				url:url,
	            		type:'POST',
           				data : {
           					"user_id":result.user_id,
           					"user_pw":result.user_pw,
           					"user_name":result.user_name,
           					"user_photo":result.user_photo,
           					"user_url":result.user_url,
           					"user_intro":result.user_intro,
           					"user_tag":tag,
           					"user_score":result.user_score,
           					"user_nickname":result.user_nickname
           				},
           				success:function(result){
           					if(result == 0){
           						location.href='${pageContext.request.contextPath}/userinfo/reconfirm';
           					}else{
           						location.href='${pageContext.request.contextPath}/';
           					}
           				}
           			});
	            }
			});
		}else{
			var form = $('#photoform')[0];
			var formData = new FormData(form);
			formData.append('user_tag',tag);
			$.ajax({
				url:'${pageContext.request.contextPath}/userinfo/userreg',
				type:'post',
				dataType:'JSON',
				data:formData,
				processData : false,
	            contentType : false,
				success:function(result){
   					if(result == 0){
   						location.href='${pageContext.request.contextPath}/userinfo/reconfirm';
   					}else{
   						location.href='${pageContext.request.contextPath}/';
   					}
   				}
			});
		}
	}
</script>
<jsp:include page="../common/layout_footer.jsp" />

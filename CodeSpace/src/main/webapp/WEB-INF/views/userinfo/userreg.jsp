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
                
                <label for="exampleInputEmail1">비밀번호</label>
                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="user_pw" />
            </c:if>
            <c:if test="${!empty googlecheck}">
                <input type="text" class="form-control h_id" name="user_id" value="${googlecheck}" readonly="readonly" />
            </c:if>
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputPassword1">이름</label>
            <input type="password" class="form-control" placeholder="이름을 입력 하세요">
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputPassword1">별명</label>
            <input type="text" class="form-control" placeholder="별명을 입력 하세요">
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputPassword1">개인 홈페이지</label>
            <input type="text" class="form-control" placeholder="URL을 입력 하세요">
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputPassword1">Tag</label>
            <input type="text" class="form-control" placeholder="Tag를 입력하세요">
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputPassword1">자기 소개</label>
            <textarea class="form-control" rows="3"></textarea>
        </div>
        
        <div class="form-group h_group">
            <label for="exampleInputFile">파일 업로드</label>
            <input type="file" id="exampleInputFile">
            <!-- <p class="help-block">여기에 블록레벨 도움말 예제</p> -->
        </div>
        
        <div><button formaction="#">회원 가입</button>
        </div>
</form>
<script>
/* $(function(){}) 와 같다*/
/* 정규식으로 아이디 적합테스트 */
$(document).ready(function(){
	var pattern = '^[a-zA-Z0-9][a-zA-Z0-9\.\_\-]{4,16}@[a-zA-Z0-9]+\.[a-zA-Z]{2,8}$';
	$('.h_id').focusout(function(){
		var data = $('.h_id');
		var matchid = data.val().match(pattern); 
		if(!matchid){
			$('.h_check').text('잘못된 이메일 형식입니다. 4~16자 사이의 아이디를 입력해주세요!').css('color','red');
				if(data.val()==''){				
					$('.h_check').text('필수 정보 입니다!!').css('color','red');
				}
		}else if(matchid){
			$.ajax({
				url:'${pageContext.request.contextPath}/userinfo/useridcheck',
				type:'post',
				data:{
					'user_id':data.val()
				},
				success:function(response){
					if(response==''){
						$('.h_check').text('멋진 Email이네요!!').css('color','#fff');
					}else{
						$('.h_check').text('이미 사용중인 Email입니다...').css('color','red');
					}
				}
			});
		}
		
	});
});
</script>
<jsp:include page="../common/layout_footer.jsp" />

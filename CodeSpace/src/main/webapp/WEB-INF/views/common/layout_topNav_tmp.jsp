<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-dark bg-dark row" >
			<!-- Navbar content -->
		<a class="navbar-brand col-md-4" 
			href="${pageContext.request.contextPath}"
			style="text-decoration: none; color: white">CODESPACE</a>
	
		<form class="form-inline col-md-4 my-2 my-lg-0" action="${pageContext.request.contextPath}/search/searchResults">
				<input class="form-control mr-sm-2" type="search" name="keyword" id="mainSearchBox" 
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-info my-2 my-sm-0" id="searchBtn" type="submit">Search</button>
		</form>
		
		<div class="col-md-4 row justify-content-end" >
			<a class="col-md-1" href="${pageContext.request.contextPath}/mypage/mypage" style="margin: 0px 0px 10px 0px"> 
				<i class="fa fa-user-circle fa-lg y_user" style="color: white; margin-top: 18px;"></i>
			</a>
			<form class="form-inline col-md-3" style="margin-right: 80px">
				<button class="btn btn-outline-info btn-info" id="k_loginBtn"
					data-target="#loginModal" data-toggle="modal" type="button">
						로그인 및 회원가입
				</button>
			</form>
		</div>
</nav> 

<!-- Modal -->
<div id="loginModal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"></button>
        <h4 class="modal-title"> CODESPACE </h4>
      </div>
      <div class="modal-body">
        <p id="k_ptag">코드스페이스에 오신 것을 환영 합니다.<br> 로그인 또는 회원 가입을 해주세요.</p>
      </div>
      <div class="modal-footer">
      <c:if test="${empty googlecheck && empty loginInfo}">
	      <button onclick="signUp()" class="btn btn-success" style="margin-left: 10px; margin-bottom: 0px; width: 120px; height: 36px;">회원 가입</button>
		  <button class="g-signin2 h_login" data-onsuccess="onSignIn"></button>
		  <!-- 어찌할지 같이 생각좀 해봐야겠다 페이지 넘길지 창으로 할지 -->
		  <button onclick="loginIn()" class="btn btn-success" style="margin-left: 10px; margin-bottom: 0px; width: 120px; height: 36px;">로그인</button>
      </c:if>
      
      <c:if test="${!empty googlecheck && empty loginInfo }">
		  <button onclick="signUp()" class="btn btn-success">회원 가입</button>
		  <button type="button" class="btn btn-success" onclick="signOut()">로그아웃</button>
	      <button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
      </c:if>
      
      <c:if test="${!empty loginInfo }">
	      <button type="button" class="btn btn-success" onclick="signOut()">로그아웃</button>
		  <button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
		  <script>
			  $('#k_ptag').html('코드스페이스 입니다 <br> 안녕히 가세요.');
			  $('#k_loginBtn').text('로그아웃');
		  </script>
      </c:if>
      	<%-- <c:choose>
			<c:when test="${empty googlecheck}" >
				<button onclick="signUp()" class="btn btn-success" style="margin-left: 10px; margin-bottom: 0px; width: 120px; height: 36px;">회원 가입</button>
				<button class="g-signin2 h_login" data-onsuccess="onSignIn"></button>
				<!-- 어찌할지 같이 생각좀 해봐야겠다 페이지 넘길지 창으로 할지 -->
				<button onclick="loginIn()" class="btn btn-success" style="margin-left: 10px; margin-bottom: 0px; width: 120px; height: 36px;">로그인</button>
			</c:when>

			<c:otherwise>
				<c:choose>
						<c:when test="${empty loginInfo }">
						 	<c:if test="${!empty googlecheck}">
							<button onclick="signUp()" class="btn btn-success">회원 가입</button>
							</c:if>
							<button type="button" class="btn btn-success" onclick="signOut()">로그아웃</button>
							<button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
						</c:when>
						
						<c:otherwise>
							<button type="button" class="btn btn-success" onclick="signOut()">로그아웃</button>
							<button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
							<script>
								$('#k_ptag').html('코드스페이스 입니다 <br> 안녕히 가세요.');
								$('#k_loginBtn').text('로그아웃');
							</script>
						</c:otherwise>
				</c:choose>								
			</c:otherwise>
		</c:choose> --%>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
	function signUp(){
		var userid="${googlecheck}";
		location.href="${pageContext.request.contextPath}/userinfo/userreg?user_id="+userid;
	}
	/* 로그인 후 사용자의 정보를 받아옴 */
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		var email = profile.getEmail();
		/* 디비가서 회원이 가입되어있나 아닌가 확인 */
		if(<c:out value='${empty googlecheck }'/>){
			$.ajax({
				url:'${pageContext.request.contextPath}/userinfo/usercheck',
				dataType:'json',
				data:{
					"user_id":email
				},
				/* 여기서 session값 현재 구글로그인 id 로 되어있음(googlecheck) */
				success:function(response){
					if(response.user_no == 0){
						 /* 회원가입 안된걸로 판단하고 가입페이지로 이동 */ 
						location.href = "${pageContext.request.contextPath}/userinfo/userreg?user_id=" + email; 
					}else{
						 /* 로그인 시간 update */ 
						$.ajax({
							url:'${pageContext.request.contextPath}/userinfo/userloginupdate?user_id='+ email,
							success:function(){
								location.href="${pageContext.request.contextPath}/";
							}
						});
					} 
				}			
			});
		}
	}
	/* 로그아웃후 사용자 정보 삭제를 위한 코드 */
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut();
		auth2.disconnect();
		$.ajax({
			url:'${pageContext.request.contextPath}/userinfo/userlogout',
			success:function(data){
				location.href='${pageContext.request.contextPath}/';
			}
		});
	}
	
	function loginIn(){
		location.href = '${pageContext.request.contextPath}/userinfo/userlogin';
	}
	
	function search(){
		
		$('#searchBtn').on("click", function(event){
			
			self.location = "${pageContext.request.contextPath}/search/searchResults"
							+ '${pageMaker.makeSearch(1)}'
							+ "&keyword=" + encodeURIComponent($('#keyword').val());
							
		});
	}
	
	
</script>


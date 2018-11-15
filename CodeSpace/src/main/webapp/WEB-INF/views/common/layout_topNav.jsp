<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource 
	url="jdbc:mysql://codespace.cdsolxxcq1w4.ap-northeast-2.rds.amazonaws.com/codespace?characterEncoding=utf8"
	driver="com.mysql.jdbc.Driver"
	user="sujini"
	password="Bitcamp!123456"
	var="regUser"
	scope="page"/>
<sql:query var="rs1" dataSource="${regUser}">
	select * from userinfo;
</sql:query>

<c:forEach var="kkk" items="${rs1.user_id}">
<h1>${kkk}</h1>
</c:forEach> --%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header" style="float: left; margin-left: 180px;">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">코드스페이스</a>
		</div>
		<div id="navbar" class="navbar-collapse colla-pse" style="margin-left:180px; float: left;">
			<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/search/searchResults">
				<input type="text" class="form-control" placeholder="Search" name="mainSearch">
				<button type="submit" class="btn btn-success">검색</button>
			</form>
		</div>

		<div style="float: left; margin-left: 200px;">
			<a href="${pageContext.request.contextPath}/mypage/mypage"> 
			<i class="fa fa-user-circle fa-lg y_user" style="color: white; margin-top: 18px;"></i>
			</a>
			
			<!-- session에 로그인 사용자 정보 유무 확인 -->
			<!-- google너 Empty 하니? 응 = true /// 아니 나 뭐 있어 = false -->
		<c:choose>
		
			<c:when test="${empty googlecheck}" >
					<button class="g-signin2 h_login" data-onsuccess="onSignIn"></button>		
			</c:when>
			
			<c:otherwise>
				<c:choose>
						<c:when test="${empty loginInfo }">
								<button onclick="signUp()" class="btn btn-success" style="margin-left: 10px; margin-bottom: 0px; width: 120px;height: 36px;">회원 가입</button>
								<button type="button" class="btn btn-success" onclick="signOut()" style="margin-left: 10px; margin-bottom: 0px; width: 120px;height: 36px;">로그아웃</button>
								<button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
						</c:when>
						
						<c:otherwise>
							<button type="button" class="btn btn-success" onclick="signOut()" style="margin-left: 10px; margin-bottom: 0px; width: 120px;height: 36px;">로그아웃</button>
							<button hidden="hidden" class="g-signin2" data-onsuccess="onSignIn"></button>
						</c:otherwise>
				</c:choose>								
			</c:otherwise>
			
		</c:choose>
						
		</div>
	</div>
</nav>
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
				dataType:'JSON',
				data:{
					"user_id":email
				},
				success:function(response){
					if(response.user_no == 0){
						/* 회원가입 안된걸로 판단하고 가입페이지로 이동 */
						 location.href = "${pageContext.request.contextPath}/userinfo/userreg?user_id=" + email;
					}else{
						/* 로그인 시간 update */
						$.ajax({
							url:'${pageContext.request.contextPath}/userinfo/userloginupdate?user_id='+ email,
							success:function(){
								location.reload();
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
</script>


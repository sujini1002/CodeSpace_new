<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="common/layout_top.jsp" />
<jsp:include page="common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 70px;">



<!-- <button type="button" class="btn btn-primary k_insertBtn"
	onclick="isLogin()">질문 작성</button> -->
<div class="container">
	<div class="row">
	   	<div class="list-container col-8">
		<h1 class="head-container">Top Questions
			<button type="button"
					class="btn btn-default btn btn-primary k_insertBtn"
					data-container="body" data-toggle="popover" data-placement="bottom"
					onclick="isLogin(this)" data-content="로그인이 필요한 기능 입니다.">질문하기</button>
		</h1>
		<!-- <h5>//Top Question에 대한 설명// -->
		</h5>
	   		<c:if test="${empty topQuestions}">
	      	 	<div class="result-noList">
	         		<h2>질문이 없습니다.</h2>
	         	</div>
	      	</c:if>
	      
	      	<c:if test="${!empty topQuestions}">
	         	<div class="result-List">
	            <hr class="top-hr">
	            <c:forEach var="questionList" items="${topQuestions}" begin="0" end="${fn:length(topQuestions)}" varStatus="num">
	               <div class="row result-row">
	                  <div class="col-lg-1 question-viewCnt">
	                     <div class="question-number">${questionList.q_viewCnt}</div>
	                     <h6>조회</h6>
	                  </div>
	                  <div class="col-lg-1 question-recommCnt">
	                     <div class="question-number">${questionList.q_recommand}</div>
	                     <h6>추천</h6>
	                  </div>
	                  <div class="col-lg-7 question-title">
	                     <div class="result-link">
	                     	<h5><a href="${pageContext.request.contextPath}/question/questionView?q_no=${questionList.q_no}">${questionList.q_title}</a></h5>
	                     </div>
	                     <div class="questions-tag questions-tag-<c:out value="${num.index}"/>">
						 </div>
	                  </div> <!-- question-title 끝 -->
	                  <div class="col-lg-3 question-info">
	                     	<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${questionList.user_no}">${questionList.user_nickname}</a>
	                     	<div>${questionList.q_regdate}</div>
	                  </div>
	               </div> <!-- 게시글 row행 끝 -->
	               <div><hr class="bottom-hr"/></div>
	            </c:forEach>
	            <br>
	         </div> <!-- result-List 끝 -->
	      </c:if><!-- !empty 조건 -->
	      </div>
	    <div class="col" >
	    	 <div class="card"  style="width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title">명예의 전당  <img src="${pageContext.request.contextPath}/images/crown.png"></h5>
			    
			    
			    <div class="row">
							<div class="col-3">순위</div>
							<div class="col-6">닉네임</div>
							<div class="col-3">score</div>
				<c:forEach var="users" items="${topUsers }" varStatus="status">
			    	<div class="col-3">
			    		${status.count} 
			    	</div>
			    	<div class="col-6" id="k_homeRankImg">
			    	<img class="k_userImg" src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${users.user_photo==null}">noimage.png</c:when><c:otherwise>${users.user_photo}</c:otherwise></c:choose>" />
			    	<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${users.user_no}">${users.user_nickname }</a>
			    	</div>
			    	<div class="col-3">
			    	${users.user_score }
			    	</div>
			    </c:forEach>
			    </div>
			    
			    <%-- <p class="card-text">
	    		<c:forEach var="users" items="${topUsers }" varStatus="status">
	    			${status.count }. 
	    			<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${users.user_no}">${users.user_nickname }</a>
	    			${users.user_score }
	    			<br>
	    		</c:forEach>
	    		</p> --%>
	    	  </div>
	    	</div> 
	    	
	    	
	    	<%-- <div class="card" style="width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title">명예의 전당  <img src="${pageContext.request.contextPath}/images/crown.png"></h5>
			    
			    <p class="card-text">
	    		<c:forEach var="users" items="${topUsers }" varStatus="status">
	    			${status.count }.
	    			<img src="${pageContext.request.contextPath}/uploadfile/userphoto/${users.user_photo}" style="width: 40px; height: 40px;">
	    		    ${users.user_name }
	    			${users.user_score }
	    			<br>
	    		</c:forEach>
	    		</p>
	    	  </div>
	    	</div>
	     --%>
	    
	    
	    
	    	<br>
	      	<div class="card" style="width: 18rem; ">
			  <div class="card-body" >
			    <h5 class="card-title">최근 소식 <span class="badge badge-warning">New</span>
			    </h5>
			    <c:forEach var="item" items="${currentNews }" >
				    <p class="card-text">
				    	<a href="${pageContext.request.contextPath}/news/newsView?n_no=${item.n_no }">${item.n_title }</a>
				    </p>
				    <hr>
			    </c:forEach>
			    <a href="${pageContext.request.contextPath}/news/news" class="btn-sm btn-primary">전체 소식 보기</a>
			  </div>
			</div>
	    </div>
   </div> <!-- list-container 끝 -->
   
</div> <!-- container 끝  -->






<!-- 모달 -->
<div id="k_loginModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">로그인하기</h4>
      </div>
      <div class="modal-body">
        <p>질문등록은 로그인이 필요한 영역입니다.<br>로그인 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-info" onclick="k_loginPage()">로그인</button>
      </div>
    </div>

  </div>
</div>






<script>
	
	$(document).ready(function(){
		
		var length = '${fn:length(topQuestions)}' * 1;
		
		<c:forEach items="${topQuestions}" var="questionList" begin="0" end="${fn:length(topQuestions)}" varStatus="tag">
		
			var tags = '${questionList.q_tag}';
			var tagArr = tags.split("/");
			
			for(var i in tagArr){
				if(tagArr[i] != ''){
					$('.questions-tag-'+<c:out value="${tag.index}"/>).append('<div class="tag-box"><button type="button" onclick="moveTag(this.value)" class="btn btn-sm" value="'+ tagArr[i] +'">'+tagArr[i]+'</button></div>');
				}
			}
			
		</c:forEach>
		
	})
	
	function moveTag(tag){
						
		var tagValue = tag;
						
		location.href="${pageContext.request.contextPath}/search/tagged?tag="+tagValue;
						
	}
	


	function isLogin(data) {
		var session = '${loginInfo.user_no}';
		console.log(session);
		console.log(session == "");
		if (session == "") {
			$('#k_loginModal').modal();
		} else {
			$('[data-toggle="popover"]').prop("disabled", false);
			location.href = '${pageContext.request.contextPath}/question/insertQuestion';
		} 
	}
	function k_loginPage(){
		location.href = '${pageContext.request.contextPath}/userinfo/userlogin';
	}
</script>

<!-- 주석 -->
<jsp:include page="common/layout_footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="common/layout_top.jsp" />
<jsp:include page="common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 70px;">



<!-- <button type="button" class="btn btn-primary k_insertBtn"
	onclick="isLogin()">질문 작성</button> -->
<div class="container">
   <div class="head-container">
      <h1>Top Questions</h1>
	
	<button type="button"
		class="btn btn-default btn btn-primary k_insertBtn"
		data-container="body" data-toggle="popover" data-placement="bottom"
		onclick="isLogin(this)" data-content="로그인이 필요한 기능 입니다.">질문 작성</button>
   </div>
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
	
	<br>
   	<br>
   	<div class="list-container">
   		<c:if test="${empty topQuestions}">
      	 	<div class="result-noList">
         		<h2>질문이 없습니다.</h2>
         	</div>
      	</c:if>
      
      	<c:if test="${!empty topQuestions}">
         	<div class="result-List">
            <hr class="top-hr">
            <c:forEach var="questionList" items="${topQuestions}">
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
                     	<h3><a href="${pageContext.request.contextPath}/question/questionView?q_no=${questionList.q_no}">${questionList.q_title}</a></h3>
                     </div>
                     <span class="result-tag"><a href="#"><h6>${questionList.q_tag}</h6></a></span>
                  </div> <!-- question-title 끝 -->
                  <div class="col-lg-3 question-info">
                     	<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${questionList.user_no}">${questionList.user_nickname}</a>
                     	<div>${questionList.q_regdate}</div>
                  </div>
               </div> <!-- 게시글 row행 끝 -->
               <hr/>
            </c:forEach>
            <br>
         </div> <!-- result-List 끝 -->
      </c:if><!-- !empty 조건 -->
   </div> <!-- list-container 끝 -->
   
</div> <!-- container 끝  -->


<jsp:include page="common/layout_footer.jsp" />
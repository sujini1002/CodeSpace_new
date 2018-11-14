<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<div id="container">
   <div id="head-container">
   
      <h1>Search Results</h1>
   
   </div>
   <br>
   <br>
   
   <div id="list-container">
      <c:if test="${empty searchResult }">
         <h1>검색된 결과가 없습니다.</h1>
      </c:if>
      <c:if test="${!empty searchResult}">
         <div class="result-List">
         	<h4>검색 키워드 : "${keyword}"</h4><br>
            <h5>${searchCount}개의 검색 결과</h5>
            <hr>
            <c:forEach var="searchResult" items="${searchResult}">
               <div class="row">
                  <div class="col-lg-1 result-cell">
                     ${searchResult.q_viewCnt}<br>조회수
                  </div>
                  <div class="col-lg-1 result-cell">
                     ${searchResult.q_recommand}<br>추천수
                  </div>
                  <div class="col-lg-7 result-cell">
                     <a href="${pageContext.request.contextPath}/question/questionView?q_no=${searchResult.q_no}">${searchResult.q_title}</a>
                  </div>
               </div> <!-- 게시글 row행 끝 -->
            </c:forEach>
         </div> <!-- result-List 끝 -->
      </c:if>
   </div> <!-- list-container 끝 -->
</div> <!-- container 끝  -->


<!-- 주석 -->
<jsp:include page="../common/layout_footer.jsp" />

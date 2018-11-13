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
            <h4>${searchCount}개의검색 결과</h4>
            <hr>
            <c:forEach var="searchResult" items="${searchResult}">
               <div class="row">
                  <div class="col-lg-1 result-cell">
                     ${searchResult.q_viewcnt}<br>조회수
                  </div>
                  <div class="col-lg-1 result-cell">
                     ${searchResult.q_recommand}<br>추천수
                  </div>
                  <div class="col-lg-7 result-cell">
                     <a href="${pageContext.request.contextPath}/question/questionView?q_no=${searchResult.q_no}">${searchResult.q_title}</a>
                  </div>
               </div>   
            </c:forEach>
            
            <!--  
            <table>
               <c:forEach var="searchResult" items="${searchResult}">
                  <tr>
                     <td>${searchResult.q_viewcnt}<br>조회수</td>
                     <td>${searchResult.q_recommand}<br>추천수</td>
                     <td><a href="${pageContext.request.contextPath}/question/questionView?q_no=${searchResult.q_no}">${searchResult.q_title}</a></td>
                  </tr>
               </c:forEach>
            </table>
            -->
         </div>
      </c:if>
   </div>
</div>


<!-- 주석 -->
<jsp:include page="../common/layout_footer.jsp" />

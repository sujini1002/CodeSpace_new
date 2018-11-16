<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<div class="container">
   <div class="head-container">
   
      <h1>Search Results</h1>
   
   </div>
   <br>
   <br>
   <div class="list-container">
      <c:if test="${empty searchResult}">
      	 <div class="result-noList">
      	 	<h4>검색 키워드 : "${keyword}"</h4><br>
         	<h2>"${keyword}"에 대해 검색된 결과가 없습니다.</h2>
         </div>
      </c:if>
      
      <c:if test="${!empty searchResult}">
      
      	 <c:if test="${keyword eq '' or keyword eq null}">
      	 	<c:set var="value" value="" />
      	 	<div class="result-noList">
      	 		<h4>검색 키워드 : "${value}"</h4><br>
         		<h2>"${value}"에 대해 검색된 결과가 없습니다.</h2>
         	</div>
      	 </c:if>
         
         <c:if test="${keyword ne '' and keyword ne null}">
         <div class="result-List">
         	<h4>검색 키워드 : "${keyword}"</h4><br>
            <h5>"${keyword}"에 대한 ${searchCount}개의 검색 결과</h5>
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
         </c:if> <!-- ne 조건 -->
      </c:if><!-- !empty 조건 -->
   </div> <!-- list-container 끝 -->
   
   <hr><hr>

<div>

	<c:forEach var="test" items="${paging}">
		<div class="row">
			<div class="col-lg-1 result-cell">
				${test.q_viewCnt}<br>조회수
            </div>
            <div class="col-lg-1 result-cell">
                ${test.q_recommand}<br>추천수
            </div>
            <div class="col-lg-7 result-cell">
                <a href="${pageContext.request.contextPath}/question/questionView?q_no=${test.q_no}">${test.q_title}</a>
            </div>
        </div> <!-- 게시글 row행 끝 -->
    </c:forEach>
    
    
    <br><br><br>
    
    <div class="text-center">
    	<ul class="pagination">
    		<c:if test="${pageMaker.prev}">
    			<li><a href="${pageContext.request.contextPath}/search/searchResults?mainSearch=${keyword}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
    		</c:if>
    		
    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    			<li
    				<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
    				<a href="${pageContext.request.contextPath}/search/searchResults?mainSearch=${keyword}&page=${idx}">${idx}</a>
    			</li>	
    		</c:forEach>
    		
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li><a href="${pageContext.request.contextPath}/search/searchResults?mainSearch=${keyword}&page=${pageMaker.endPage + 1}">&raquo;</a></li>
    		</c:if>
    	</ul>
    </div>
    
    
</div>
   
</div> <!-- container 끝  -->




<!-- 주석 -->
<jsp:include page="../common/layout_footer.jsp" />

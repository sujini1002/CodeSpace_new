<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->
<div class="container">
	
	<h1>Questions</h1>
	
	<div>

	<c:forEach var="test" items="${list}">
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
    			<li><a href="${pageContext.request.contextPath}/questions/questions?page=${pageMaker.startPage - 1}">&laquo;</a></li>
    		</c:if>
    		
    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    			<li
    				<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
    				<a href="${pageContext.request.contextPath}/questions/questions?page=${idx}">${idx}</a>
    			</li>	
    		</c:forEach>
    		
    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    			<li><a href="${pageContext.request.contextPath}/questions/questions?page=${pageMaker.endPage + 1}">&raquo;</a></li>
    		</c:if>
    	</ul>
    </div>
    
    
</div>

</div>

<!-- 주석 -->
<jsp:include page="../common/layout_footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->

<!-- 검색 창 입력 시 비동기 처리로 회원 정보 검색 -->
<div class="container">
   <div class="head-container">
      <h1>Stars in Space</h1>
      
      <div id="navbar" class="userSearch">
         <div class="userSearchBar">
            <input type="text" class="form-control" placeholder="Filter by user" name="user_nickname">
            <!--  
            <form class="navbar-form" action="${pageContext.request.contextPath}/search/mainSearchPage">
               <input type="text" class="form-control" placeholder="Filter by user" name="userSearchValue">
               <button type="submit" class="btn btn-success">검색</button>
            </form>
            -->
         </div>
         
         <div class="userListChange">
            <a href="#">바둑판식 보기</a> &nbsp; | &nbsp;
            <a href="#">리스트 보기</a>
         </div>
         
      </div>
   </div>
   <br>
   <hr>
   <br>
   
   <div class="list-container">
  
      
      <c:if test="${!empty userList}">
	      <div class="userList">
		      <div class="row user-row">
	      	  <c:forEach var="userInfo" items="${userList}">
	      	  	<div class="row col-lg-3 user-info">
		      		<div class="col-lg-4 userPic">
		      			<div class="picInfo"><a href="#"><img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="93" height="90"></a></div>
		      		</div>
		      		<div class="col-lg-8 user-detail">
		      			<div class="col-lg-12 user-detail-attribute user-nickname"><a href="#">${userInfo.user_nickname}</a></div>
		      			<div class="col-lg-12 user-detail-attribute user-intro">${userInfo.user_intro}</div>
		      			<div class="col-lg-12 user-detail-attribute user-score">${userInfo.user_score}</div>
		      		</div>
		      		<div class="row col-lg-12 user-tag">
		      			<div class="col-lg-4"></div>
		      			<div class="col-lg-8">${userInfo.user_tag}</div>
		      		</div>
		      	</div>
		      </c:forEach>
		      </div>
	      </div>
	      
	      <br>
            <div class="search-paging">
			    <div class="text-center">
			    	<ul class="pagination">
			    		<c:if test="${pageMaker.prev}">
			    			<li><a href="${pageContext.request.contextPath}/user/userList${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
			    		</c:if>
			    		
			    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    			<li class="paging-number"
			    				<c:out value="${pageMaker.userCri.page == idx?'class =active':''}"/>>
			    				<a href="${pageContext.request.contextPath}/user/userList${pageMaker.makeSearch(idx)}">${idx}</a>
			    			</li>	
			    		</c:forEach>
			    		
			    		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    			<li><a href="${pageContext.request.contextPath}/user/userList${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
			    		</c:if>
			    	</ul>
    			</div>
			</div>
	          <script>
      //   $(document).ready(function(){
            
    //        searchUser();
            
   //      });
         
    //     function searchUser(){
            
            $("input:text[name=user_nickname]").keyup(function(){
               
               var user_nickname = $("input:text[name=user_nickname]").val(); // 검색 창에 입력한 값
               
                  $.ajax({
                     type: 'POST',
                     url: '${pageContext.request.contextPath}/user/userList',
                     data: {user_nickname : user_nickname},
                     dataType: 'json',
                     success: function(result){
                        console.log("result : " + result);
                        $(".userList").html('');
                        if(result.length > 0){
                           var str='';
                           str +=	'<div class="row user-row">';
                           				for(var i=0;i<result.length;i++){
                              				console.log(result[i]);
                              				str += '<div class="row col-lg-3 user-info">'
                              					+		'<div class="col-lg-4 userPic">'
                              					+			'<div class="picInfo">'
                              					+				'<a href="#">'
                              					+ 				'<img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="93" height="90">'
                              					+				'</a>
                              					+			'</div>'
                              					+		'</div>'
                              					+		'<div class="col-lg-8 user-detail">'
                              					+			'<div class="col-lg-12 user-detail-attribute user-nickname">'
                              					+				'<a href="#">' + result[i].user_nickname + '</a>'
                              					+			'</div>'
                              					+			'<div class="col-lg-12 user-detail-attribute user-intro">'
                              					+ 				result[i].user_intro 
                              					+ 			'</div>'
                              					+			'<div class="col-lg-12 user-detail-attribute user-score">'
                              					+				result[i].user_score
                              					+			'</div>'
                              					+		'</div>'
                              					+		'<div class="row col-lg-12 user-tag">'
                              					+			'<div class="col-lg-4"></div>'
                              					+			'<div class="col-lg-8">'+ result[i].user_tag + '</div>'
                              					+		'</div>'
                              					+	'</div>'
                           
                           				}
                           str += '</div>'; // div class="row user-row" 끝
                           $(".userList").html(str);
                        }else{
                           str = '검색된 결과가 없습니다.';
                           $(".userList").html(str);
                        }
                     },
                     error: function(e){
                        console.log('error : ' + e.status);
                     }
                  }); // ajax 끝
            }); // keyup function 끝
      //   }
         
      </script>
      </c:if>
         <%-- <table class="userListTbl" border="1px solid black">
            <tr>
               <c:set var="cnt" value="0" />
               <c:forEach var="userInfo" items="${userList}">
               <c:set var="cnt" value="${cnt+1}"></c:set>
               <td colspan=3 class="userListTblImg"></td>
               <td colspan=3 class="userListTblContent">
                  ${userInfo.user_nickname}·${userInfo.user_score}<br>
                  ${userInfo.user_intro}<br>
                  ${userInfo.user_tag}
               </td>
         
               <c:if test="${(cnt mod 3) eq 0}">
                  </tr><tr>
               </c:if>
               </c:forEach>
            </tr>
         </table> --%>
   
   </div> <!-- list-container 끝 -->

<div> <!-- main-container 끝 -->



	
<jsp:include page="../common/layout_footer.jsp" />

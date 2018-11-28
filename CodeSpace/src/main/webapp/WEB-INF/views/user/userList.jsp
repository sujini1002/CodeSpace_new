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
         
         <div class="user-view-filter">
            <span class="viewGrid">
            	<a href="#" onclick="showGrid()">
            		<img src="https://image.flaticon.com/icons/svg/1250/1250641.svg" height=25 width=25>
				</a>
			</span> &nbsp; &nbsp; &nbsp; 
			<span class="viewList">
				<a href="#" onclick="showList()">
					<img src="https://image.flaticon.com/icons/svg/1141/1141964.svg" height=25 width=25>
				</a>
			</span>
         </div>
         
         <script>

       		function showList(){
       		
       			var type="list";
       		
       			location.href="${pageContext.request.contextPath}/user/userList?viewType="+type;
       		
       		}
       		
       		function showGrid(){
           		
       			var type="grid";
       		
       			location.href="${pageContext.request.contextPath}/user/userList?viewType="+type;
       		
       		}
         
         </script>
         
      </div> <!-- userSearch class 끝 -->
   </div> <!-- head-container class 끝 -->
   <br>
   <hr class="top-hr">
   <br>
   
   <div class="list-container">
      <c:if test="${!empty userList}">
      	 <c:if test="${pageMaker.userCri.viewType eq 'grid'}">
         <div class="userList">
            <div class="row user-row">
              <c:forEach var="userInfo" items="${userList}">
                 <div class="row col-lg-3 user-info">
                  <div class="col-lg-4 userPic">
                     <div class="picInfo"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}"><img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="93" height="90"></a></div>
                  </div>
                  <div class="col-lg-8 user-detail">
                     <div class="col-lg-12 user-detail-attribute user-nickname"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">${userInfo.user_nickname}</a></div>
                     <div class="col-lg-12 user-detail-attribute user-intro">${userInfo.user_intro}</div>
                     <div class="col-lg-12 user-detail-attribute user-score">${userInfo.user_score}</div>
                  </div>
                  <div class="row col-lg-12 user-tag">	
                     <div class="col-lg-4"></div>
                     <div class="col-lg-8"><span class="tag-value">${userInfo.user_tag}</span></div>
                  </div>
               </div>
            </c:forEach>
            </div>
            
            <br>
            <div class="search-paging">
             <div class="text-center">
                <ul class="pagination justify-content-center">
                   <c:if test="${pageMaker.prev}">
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(pageMaker.startPage - 1)}">&laquo;</a></li>
                   </c:if>
                   
                   <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                      <li class="page-item"
                         <c:out value="${pageMaker.userCri.page == idx?'class =active':''}"/>>
                         <a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(idx)}">${idx}</a>
                      </li>   
                   </c:forEach>
                   
                   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(pageMaker.endPage + 1)}">&raquo;</a></li>
                   </c:if>
                </ul>
             </div>
         	</div> <!-- <div=search-paging> 끝 -->
         </div><!-- <div=userList> 끝 -->
		</c:if> <!-- c:if viewType=="grid" -->
      
      	<c:if test="${pageMaker.userCri.viewType eq 'list'}">
	      
	      <div class="userList">
	            <div class="row user-list-row">
	               <c:forEach var="userInfo" items="${userList}">
	                 <div class="row col-lg-12">
		                  <div class="col-lg-1 user-view-list-pic">
		                     <div class="picInfo"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}"><img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="90" height="90"></a></div>
		                  </div>
		                  <div class="col-lg-8 user-view-list-detail">
		                  	 <div class="row col-lg-12">
		                  	 	<div class="row col-lg-12 user-detail-attribute user-view-list-title">
		                  	 		<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">${userInfo.user_nickname}</a>
		                  	 		<div class="col-lg-3 user-detail-attribute user-score">&nbsp;· ${userInfo.user_score}</div>
		                  	 	</div>
		                  	 </div>
		                     <div class="col-lg-12 user-detail-attribute user-intro">${userInfo.user_intro}</div>
		                     <div class="col-lg-12 user-detail-attribute user-view-list-tag"><span class="tag-value">${userInfo.user_tag}</span></div>
		                  </div>
	               	 </div>
	               <div><hr width="1110px"></div>
	               </c:forEach>
	            </div>
	            
	            <br>
	            <div class="search-paging">
	             <div class="text-center">
	                <ul class="pagination justify-content-center">
	                   <c:if test="${pageMaker.prev}">
	                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(pageMaker.startPage - 1)}">&laquo;</a></li>
	                   </c:if>
	                   
	                   <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                      <li class="page-item"
	                         <c:out value="${pageMaker.userCri.page == idx?'class =active':''}"/>>
	                         <a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(idx)}">${idx}</a>
	                      </li>   
	                   </c:forEach>
	                   
	                   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(pageMaker.endPage + 1)}">&raquo;</a></li>
	                   </c:if>
	                </ul>
	             </div>
	         	</div>
	       </div><!-- <div=userList> 끝 -->
      	</c:if> <!-- c:if viewType=="list" -->
      
      
      


			<script>
          
          	function ajaxList(user_nickname, pageNum, view){
          		
          		var nickname = user_nickname;
          		var page = pageNum;
          		var viewType = view
          		
          		
          		if(!page){
          			page = parseInt('1');
          		}
          		
          		var sendData = {user_nickname : nickname, page : pageNum, viewType : viewType}
          		
          		$.ajax({
                    type: 'GET',
                    async: false,
                    url: '${pageContext.request.contextPath}/user/search',
                    data: sendData,
                    dataType: 'json',
                    success: function(result){
                       
                       $(".userList").empty();
                       
                       if(result[0].length > 0){
                    	   
                     	  if($("input:text[name=user_nickname]").val()!='' && user_nickname==''){

                               var str = '검색된 결과가 없습니다.';
                               $(".userList").html(str);

                           }else{
 		                           var list = result[0];
 		                           var paging = result[1];
 		         
 		                           console.log("nickname : " + paging.userCri.user_nickname);
 		                           console.log("totalCount : " + paging.totalCount);
 		                           console.log("userTotalCount : " + paging.userTotalCount);
 		                           console.log("startPage : " + paging.startPage);
 		                           console.log("endPage : " + paging.endPage);
 		                           console.log("prev : " + paging.prev);
 		                           console.log("next : " + paging.next);
 		                           console.log("viewType : " + paging.userCri.viewType);
 		                           
 		                           var viewType = paging.userCri.viewType;
 		                           
 		                           var str='';
 		                           
 		                           console.log("현재 viewType : " + viewType);
 		                           
 		                           if(viewType=='grid'){
 		        				                      
 		                           str += '<div class="row user-row">';
 		                           				for(var i=0;i<list.length;i++){
 		                              				
 		                              				if(list[i].user_intro==null){
 		                              					list[i].user_intro='';
 		                              				}
 		                              				
 		                              				if(list[i].user_tag==null){
 		                              					list[i].user_tag='';
 		                              				}
 		                              			
 		                              				str += '<div class="row col-lg-3 user-info">'
 		                              					+		'<div class="col-lg-4 userPic">'
 		                              					+			'<div class="picInfo">'
 		                              					+				'<a href="#">'
 		                              					+ 					'<img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="93" height="90">'
 		                              					+				'</a>'
 		                              					+			'</div>'
 		                              					+		'</div>'
 		                              					+		'<div class="col-lg-8 user-detail">'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-nickname">'
 		                              					+				'<a href="#">' + list[i].user_nickname + '</a>'
 		                              					+			'</div>'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-intro">'
 		                              					+ 				list[i].user_intro 
 		                              					+ 			'</div>'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-score">'
 		                              					+				list[i].user_score
 		                              					+			'</div>'
 		                              					+		'</div>'
 		                              					+		'<div class="row col-lg-12 user-tag">'
 		                              					+			'<div class="col-lg-4"></div>'
 		                              					+			'<div class="col-lg-8"><span class="tag-value">'+ list[i].user_tag + '</span></div>'
 		                              					+		'</div>'
 		                              					+	'</div>'
 		                           
 		                           				} // for문 끝
 		                           				
 		                           str += '</div><br>';
 		                           
 		                           var val = '1';
 		                           value = parseInt(val);
 		                           
 		                           str += '<div class="search-paging">'
 		                           	   +  		'<div class="text-center">'
 		                           	   +			'<ul class="pagination justify-content-center">';
 		                           	   					
 		                           	   					if(paging.prev){
 		   				                           		   str += '<li class="page-item"><a class="page-link" onclick="paging(' + (paging.startPage-value) + ')">&laquo;</a></li>';
 		   				                           	    }
 		                           	   					
 		                           	   					for(var i=paging.startPage;i<=paging.endPage;i++){
 		                           	   						var classStr = paging.userCri.page == i ? 'class=active' : '';
 		                           	   					   	str += '<li class="page-item" ' + classStr + '><a class="page-link" onclick="paging(' + i + ')">'
 		                           	   					   	   	+  	i
 		                           	   					   	   	+  '</li>';
 		                           	   					}
 		                           	   					if(paging.next){
 		                           	   						str += '<li class="page-item"><a class="page-link" onclick="paging(' + (paging.endPage+value) + ')">&raquo;</li>';
 		                           	   					}
 		   				                           	   
 		   				          str += '</ul></div></div>';
 		                          } // grid 끝
 		                          
 		                           
 		                          /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 		                           
 		                          else if(viewType=='list'){
 		                        	  
 		                        	 str += '<div class="row user-list-row">';
                         				for(var i=0;i<list.length;i++){
                            				
                            				if(list[i].user_intro==null){
                            					list[i].user_intro='';
                            				}
                            				
                            				if(list[i].user_tag==null){
                            					list[i].user_tag='';
                            				}
                            			
                            				str     += '<div class="row col-lg-12">'
	                              					+		'<div class="col-lg-1 user-view-list-pic">'
	                              					+			'<div class="picInfo">'
	                              					+				'<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">'
	                              					+ 					'<img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201808/21/img_20180821155102_f1938162.jpg" width="90" height="90">'
	                              					+				'</a>'
	                              					+			'</div>'
	                              					+		'</div>'
	                              					+		'<div class="col-lg-8 user-view-list-detail">'
	                              					+			'<div class="row col-lg-12">'
	                              					+				'<div class="row col-lg-12 user-detail-attribute user-view-list-title">'
	                              					+					'<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">'
	                              					+							list[i].user_nickname
	                              					+					'</a>'
	                              					+					'<div class="col-lg-3 user-detail-attribute">&nbsp;· '
	                              					+						list[i].user_score
	                              					+					'</div>'
	                              					+				'</div>' // user-view-list-title 끝
	                              					+			'</div>' // col-lg-12 끝
	                              					+			'<div class="col-lg-12 user-detail-attribute user-intro">'
	                              					+ 				list[i].user_intro 
	                              					+ 			'</div>'
	                              					+			'<div class="col-lg-12 user-detail-attribute user-view-list-tag">'
	                              					+				'<span class="tag-value">'
	                              					+					list[i].user_tag
	                              					+				'</span>'
	                              					+			'</div>'
	                              					+		'</div>' // user-view-list-detail 끝
	                              					+	'</div>' // row col-lg-12 끝
	                              					+	'<div><hr width="1110px"></div>'
                         						
                         				} // for문 끝
                         				
                         str += '</div><br>';
                         
                         var val = '1';
                         value = parseInt(val);
                         
                         str   += '<div class="search-paging">'
                         	   +  		'<div class="text-center">'
                         	   +			'<ul class="pagination justify-content-center">';
                         	   					
                         	   					if(paging.prev){
 				                           		   str += '<li class="page-item"><a class="page-link" onclick="paging(' + (paging.startPage-value) + ')">&laquo;</a></li>';
 				                           	    }
                         	   					
                         	   					for(var i=paging.startPage;i<=paging.endPage;i++){
                         	   						var classStr = paging.userCri.page == i ? 'class=active' : '';
                         	   					   	str += '<li class="page-item" ' + classStr + '><a class="page-link" onclick="paging(' + i + ')">'
                         	   					   	   	+  	i
                         	   					   	   	+  '</li>';
                         	   					}
                         	   					if(paging.next){
                         	   						str += '<li class="page-item"><a class="page-link" onclick="paging(' + (paging.endPage+value) + ')">&raquo;</li>';
                         	   					}
 				                           	   
 				          str += '</ul></div></div>';
                        } // list 끝
 		                        	  
 		                        	  
 		                        	  
 		                        	  
 		   				      $(".userList").html(str);
		                        
                           } // if($("input:text[name=user_nickname]").val()!=''&&  user_nickname=='') 끝
 		                
                       }else{
                    	   str = '검색된 결과가 없습니다.';
                    	   $(".userList").html(str);
                       }// if(result.length > 0){} 끝
                    },
                    error: function(e){
                 	   console.log('error : ' + e.status);
                    }
                }); // ajax 끝
          	} // ajaxList 끝
          
            
          	
          	
          	$("input:text[name=user_nickname]").keyup(function(){
               
               var user_nickname = $("input:text[name=user_nickname]").val(); // 검색 창에 입력한 값
               
               if($.trim(user_nickname)==''){
                   user_nickname=$.trim(user_nickname);
               }
               
               // 페이지 번호 없을 시 디폴트 1로 변환해서 
               
               var page = parseInt('1');
               
               var viewType = "${pageMaker.userCri.viewType}";
               
               ajaxList(user_nickname, page, viewType);
               
            
            }); // keyup function 끝
            
            function paging(page){
          		
         		 var searchVal = $("input:text[name=user_nickname]").val();
         		 var viewType = "${pageMaker.userCri.viewType}";
         		
         		 ajaxList(searchVal, page, viewType);
         		
         	}
            
         
      </script>
      
      
      
      </c:if>
   </div> <!-- list-container 끝 -->
<div> <!-- main-container 끝 -->


   
<jsp:include page="../common/layout_footer.jsp" />
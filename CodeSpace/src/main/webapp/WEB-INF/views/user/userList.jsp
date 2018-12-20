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
         
         	$(document).ready(function(){
				
				showTag();
				
			});
         	
         	function showTag(){
         		
				var length = '${fn:length(userList)}' * 1;
				
				<c:forEach items="${userList}" var="userInfo" begin="0" end="${fn:length(userList)}" varStatus="tag">
				
					var tags = '${userInfo.user_tag}';
					var tagArr = tags.split("/");
					var viewType = '${pageMaker.userCri.viewType}'; 
						
					if(viewType == 'grid'){
						for(var i in tagArr){
							if(tagArr[i] != ''){
								$('.user-tag-'+<c:out value="${tag.index}"/>).append('<button type="button" onclick="moveTag(this.value)" class="btn btn-sm tag-info" value="'+ tagArr[i] +'">'+tagArr[i]+'</button>');
							}
						}
					}
					else if(viewType == 'list'){
						for(var i in tagArr){
							if(tagArr[i] != ''){
								$('.user-view-list-tag-'+<c:out value="${tag.index}"/>).append('<button type="button" onclick="moveTag(this.value)" class="btn btn-sm tag-info" value="'+ tagArr[i] +'">'+tagArr[i]+'</button>');
							}
						}
					}
					
				</c:forEach>
         		
         	}
         	
         	function moveTag(tag){
				
				var tagValue = tag;
				
				location.href="${pageContext.request.contextPath}/search/tagged?tag="+tagValue;
				
			}

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
	              <c:forEach var="userInfo" items="${userList}" begin="0" end="${fn:length(userList)}" varStatus="num">
	                 <div class="row col-lg-3 user-info">
	                  <div class="col-lg-3 userPic">
	                     <%-- <div class="picInfo"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}"><img src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfo.user_photo}" width="85" height="85"></a></div> --%>
	                     <div class="picInfo"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">
	                     <img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${userInfo.user_photo==null}">noimage.png</c:when><c:otherwise>${userInfo.user_photo}</c:otherwise></c:choose>" width="85" height="85"></a></div>
	                  </div>
	                  <div class="col-lg-8 user-detail">
	                     <div class="col-lg-12 user-detail-attribute user-nickname"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">${userInfo.user_nickname}</a></div>
	                     <div class="col-lg-12 user-detail-attribute user-intro">${userInfo.user_intro}</div>
	                     <div class="col-lg-12 user-detail-attribute user-score">${userInfo.user_score}</div>
	                     <div class="col-lg-12 user-detail-attribute user-tag-<c:out value="${num.index}"/>"></div>
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
	                   		<li class="page-item" <c:out value="${pageMaker.userCri.page == idx?'class =active':''}"/>>
	                   			<a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(idx)}">${idx}</a>
	                      	</li>   
	                   	</c:forEach>
	                   
	                   	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                   		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/user/userList${pageMaker.makeUserList(pageMaker.endPage + 1)}">&raquo;</a></li>
	                   	</c:if>
	                </ul>
	            </div>
	         </div> <!-- <div=search-paging> 끝 -->
	        </div> <!-- userList 끝 -->
		</c:if> <!-- c:if viewType=="grid" -->
      
      	<c:if test="${pageMaker.userCri.viewType eq 'list'}">
	      
	      <div class="userList">
	            <div class="row user-list-row">
	               <c:forEach var="userInfo" items="${userList}" begin="0" end="${fn:length(userList)}" varStatus="num">
	                 <div class="row col-lg-12">
		                  <div class="col-lg-1 user-view-list-pic">
		                     <div class="picInfo"><a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">
		                     <img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${userInfo.user_photo==null}">noimage.png</c:when><c:otherwise>${userInfo.user_photo}</c:otherwise></c:choose>" width="90" height="90"></a></div>
		                  </div>
		                  <div class="col-lg-8 user-view-list-detail">
		                  	 <div class="row col-lg-12">
		                  	 	<div class="row col-lg-12 user-detail-attribute user-view-list-title">
		                  	 		<a href="${pageContext.request.contextPath}/user/usersPage?user_no=${userInfo.user_no}">${userInfo.user_nickname}</a>
		                  	 		<div class="col-lg-3 user-detail-attribute user-list-score">&nbsp;· ${userInfo.user_score}</div>
		                  	 	</div>
		                  	 </div>
		                     <div class="col-lg-12 user-detail-attribute user-intro">${userInfo.user_intro}</div>
		                     <div class="col-lg-12 user-detail-attribute user-view-list-tag-<c:out value="${num.index}"/>"></div>
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

                               var str = '검색된 Star는 없습니다.';
                               $(".userList").html(str);

                           }else{
 		                           var list = result[0];
 		                           var paging = result[1];
 		                           
 		                           var viewType = paging.userCri.viewType;
 		                           
 		                           var str='';
 		                           
 		                           if(viewType=='grid'){
 		        				                      
 		                           str += '<div class="row user-row">';
 		                           				for(var i=0;i<list.length;i++){
 		                              				
 		                              				if(list[i].user_intro==null){
 		                              					list[i].user_intro='';
 		                              				}
 		                              				
 		                              				if(list[i].user_tag==null){
 		                              					list[i].user_tag='';
 		                              				}
 		                              				
 		                              				var tags = list[i].user_tag;
 		     		                        	    var tagArr = tags.split("/");
 		                              				
 		                              				str += '<div class="row col-lg-3 user-info">'
 		                              					+		'<div class="col-lg-3 userPic">'
 		                              					+			'<div class="picInfo">'
 		                              					+				'<a href="${pageContext.request.contextPath}/user/usersPage?user_no='+ list[i].user_no +'">';
 		                              					
 		                              					if(list[i].user_photo==null){
 		                              						str += '<img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/noimage.png" width="85" height="85">';
 		                              					}else{
 		                              						str += '<img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/'+ list[i].user_photo +'" width="85" height="85">';
 		                              					}
 		                              					
 		                              				str +=				'</a>'
 		                              					+			'</div>'
 		                              					+		'</div>'
 		                              					+		'<div class="col-lg-8 user-detail">'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-nickname">'
 		                              					+				'<a href="${pageContext.request.contextPath}/user/usersPage?user_no='+ list[i].user_no +'">' + list[i].user_nickname + '</a>'
 		                              					+			'</div>'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-intro">'
 		                              					+ 				list[i].user_intro 
 		                              					+ 			'</div>'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-score">'
 		                              					+				list[i].user_score
 		                              					+			'</div>'
 		                              					+			'<div class="col-lg-12 user-detail-attribute user-tag-'+ i +'">';
 		                              					
 		                              					for(var j in tagArr){
 		                              						if(tagArr[j] != ''){
 		       	                    							str+='<button type="button" onclick="moveTag(this.value)" class="btn btn-sm tag-info" value="'+ tagArr[j] +'">'+tagArr[j]+'</button>';
 		       	                    						}
 		                              					}
 		                              					
 		                              				 str+=			'</div>'
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
                            				
                            				var tags = list[i].user_tag;
	     		                        	var tagArr = tags.split("/");
                            			
                            				str     += '<div class="row col-lg-12">'
	                              					+		'<div class="col-lg-1 user-view-list-pic">'
	                              					+			'<div class="picInfo">'
	                              					+				'<a href="${pageContext.request.contextPath}/user/usersPage?user_no='+ list[i].user_no +'">';
	                              					
	                              					if(list[i].user_photo==null){
		                              					str += '<img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/noimage.png" width="90" height="90">';
		                              				}else{
		                              					str += '<img src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/'+ list[i].user_photo +'" width="90" height="90">';
		                              				}
		                              					
		                              		str 	+=				'</a>'		
	                              					+			'</div>'
	                              					+		'</div>'
	                              					+		'<div class="col-lg-8 user-view-list-detail">'
	                              					+			'<div class="row col-lg-12">'
	                              					+				'<div class="row col-lg-12 user-detail-attribute user-view-list-title">'
	                              					+					'<a href="${pageContext.request.contextPath}/user/usersPage?user_no='+ list[i].user_no +'">'
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
	                              					+			'<div class="col-lg-12 user-detail-attribute user-view-list-tag-'+ i +'">';
	                              					
	                              					for(var j in tagArr){
		                              						if(tagArr[j] != ''){
		       	                    							str+='<button type="button" onclick="moveTag(this.value)" class="btn btn-sm tag-info" value="'+ tagArr[j] +'">'+tagArr[j]+'</button>';
		       	                    						}
		                              				}
	                              					
	                              				 str+=			'</div>'
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
      
      
      
      </c:if> <!-- !empty userList 끝 -->
   </div> <!-- list-container 끝 -->
</div> <!-- main-container 끝 -->


   
<jsp:include page="../common/layout_footer.jsp" />
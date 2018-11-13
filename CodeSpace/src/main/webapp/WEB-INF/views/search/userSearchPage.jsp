<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp"/>

<!-- 검색 창 입력 시 비동기 처리로 회원 정보 검색 -->
<div id="container">
	<div id="head-container">
		<h2>Stars in Space</h2>
		
		<div id="navbar" class="userSearch">
			<div class="userSearchBar">
				<input type="text" class="form-control" placeholder="Filter by user" name="userSearchValue">
				<!--  
				<form class="navbar-form" action="${pageContext.request.contextPath}/search/mainSearchPage">
					<input type="text" class="form-control" placeholder="Filter by user" name="userSearchValue">
					<button type="submit" class="btn btn-success">검색</button>
				</form>
				-->
			</div>
			
			<div class="userSearchListChange">
				<a href="#">바둑판식 보기</a>
				<a href="#">리스트 보기</a>
			</div>
			
		</div>
	</div>
	<hr>
	<br>
	
	<div id="list-container">
		<script>
			$(document).ready(function(){
				
				searchUser();
				
			});
			
			function searchUser(){
				
				$("input:text[name=userSearchValue]").keyup(function(){
					
					var searchWords = $("input:text[name=userSearchValue]").val(); // 검색 창에 입력한 값
					
					
						$.ajax({
							type: 'POST',
							url: '${pageContext.request.contextPath}/search/userSearchPage',
							data: {searchWords : searchWords},
							dataType: 'json',
							success: function(result){
								console.log(result);
								if(result.length > 0){
									var str='';
									str += '<table class="userListTbl" border="1px solid black"><tr>';
									for(var i=0;i<result.length;i++){
										console.log(result[i]);
										str += '<td colspan=3 class="userListTblImg"></td>'
											 + '<td colspan=3 class="userListTblContent">'+ result[i].user_name + '·' + result[i].user_score 
											 + '<br>'+ result[i].user_intro
											 + '<br>'+ result[i].user_tag + '</td>';
									
									}
									str += '</tr></table>';
									$("#userList").html(str);
								}else{
									str = '검색된 결과가 없습니다.';
									$("#userList").html(str);
								}
							},
							error: function(e){
								console.log('error : ' + e.status);
							}
						}); // ajax 끝
				}); // keyup function 끝
			}
		</script>
		
		
		<div id="userList">
			<table class="userListTbl" border="1px solid black">
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
			</table>
		</div>
	
	</div> <!-- list-container 끝 -->
	

<div> <!-- main-container 끝 -->


	
<jsp:include page="../common/layout_footer.jsp" />

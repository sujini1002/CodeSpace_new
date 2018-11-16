<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>


<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp"/>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 여기부터 화면 코드 작성해주세요 -->


<!-- 프로젝트 상세정보 표출 영역 -->
<div>
	<h3>${pro_info.project_title}  	
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectInfo">
			수정하기
		</button>
		<!-- 프로젝트는 삭제 x, 프로젝트 끝내기 버튼을 누르면 방향으로 함 -->
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#projectFinish">
			프로젝트 끝내기
		</button>
	</h3>
	<h4>${pro_info.project_content }</h4>
</div>

<!-- 사용자 추가 -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#proMemberInvite">
	사용자 초대
</button>

<!-- 캘린더와 공지사항 표출 영역  -->
<table class='table' style="width:70%;" >
	<tr>
		<td>캘린더  <a href="#">더보기</a></td>
		<td>공지사항 <a href="#">더보기</a></td>
	</tr>
	<tr>
		<td><img src="../images/stop.jpg" width=300px></td>
		<td></td>
	</tr>
</table>

<!-- REST 방식의 to do list -->
<h3>to do list: REST</h3>
<a href="${pageContext.request.contextPath}/project/tdlDashboard?project_no=${pro_info.project_no }&user_no=${user_info.user_no}">더보기</a>
<table class="table" id="tdlboard" style="width:70%;">	</table>



<jsp:include page="../common/layout_footer.jsp" />


<!-- 수정하기 모달 -->
<div class="modal fade" id="projectInfo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">프로젝트 내용 수정하기</h4>
      </div>
      <form action="/cos/project/projectUpdate" method="post">
	      <!-- project Info 수정 -->
	      <div class="modal-body">
	      	<!-- 사용자 번호 -->
	      	<input type="hidden" name="user_no" value="${user_info.user_no }">
	      	<!-- 프로젝트 번호 -->
			<input type="hidden" name="project_no" value="${pro_info.project_no }">
	      	<!-- 프로젝트 제목 -->
			<div class="form-group">
				<label>프로젝트 제목</label>
				<input class="form-control" name="project_title" value="${pro_info.project_title }" >
			</div>
	      	<!-- 프로젝트 설명 -->
			<div class="form-group">
				<label>프로젝트 설명</label>
				<input class="form-control" name="project_content" value="${pro_info.project_content }">
			</div>
	      	<!-- 종료 일정 -->
			<div class="form-group">
				<label>종료 날짜</label>
				<input type="date" class="form-control" name="prostring_enddate" value="${pro_info.prostring_enddate }">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Save changes</button>
	      </div>
	     </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 프로젝트 끝내기 모달 -->
<div class="modal fade" id="projectFinish">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">프로젝트 끝내기</h4>
      </div>
      <form action="/cos/project/projectFinish" method="post">
	      <!-- project Info 수정 -->
	      <div class="modal-body">
	      	<!-- 사용자 번호 -->
	      	<input type="hidden" name="user_no" value="${user_info.user_no }">
	      	<!-- 프로젝트 번호 -->
			<input type="hidden" name="project_no" value="${pro_info.project_no }">
	      	<!-- 프로젝트 제목 -->
			<div class="form-group">
				<label>프로젝트 제목</label>
				<input class="form-control" name="project_title" value="${pro_info.project_title }" readonly >
			</div>
	      	<!-- 프로젝트 설명 -->
			<div class="form-group">
				<label>프로젝트 설명</label>
				<input class="form-control" name="project_content" value="${pro_info.project_content }" readonly>
			</div>
	      	<!-- 종료 일정 -->
			<div class="form-group">
				<label>종료 날짜</label>
				<input type="date" class="form-control" name="prostring_enddate" value="${pro_info.prostring_enddate }" readonly>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-danger">Project Done</button>
	      </div>
	     </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- 사용자 초대하기 모달 -->
<div class="modal fade" id="proMemberInvite">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">사용자 초대하기</h4>
      </div>
      <form method="post">
	      <!-- 사용자 초대 -->
	      <div class="modal-body">
	      	<!-- 사용자 번호 -->
	      	<input type="hidden" name="user_no" value="${user_info.user_no }">
	      	<!-- 프로젝트 번호 -->
			<input type="hidden" name="project_no" value="${pro_info.project_no }">
	      	<!-- 사용자 검색하기 (자동완성)-->
			<div class="form-group">
				<label>사용자 검색하기</label>
				<input class="form-control" id="search_user">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Invite member</button>
	      </div>
	     </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->





<!-- todolist 처리를 위한 js -->
<script type="text/javascript" src="../js/todolist.js" ></script>

<script>
	var project_noValue = '<c:out value="${pro_info.project_no}" />';
	var tdlUL = $("#tdlboard");
	
	// to do list 가져오는 function
	tdlService.getList({project_no:project_noValue}, function(list) {
		var str = "<tr>";
			str += "<th>todolist_no</th>";
			str += "<th>todolist_content</th>";
			str += "<th>tdlmanager_no</th>";
			str += "<th>todolist_status</th>";
			str += "<th>todolist_enddate</th>";
			str += "</tr>";
		
		
		if(list==null || list.length==0){
			tdlUL.html("");
			return;
		}
		
		for(var i=0, len=list.length ||0; i<len; i++){
			console.log(list[i]);
			
			str += "<tr data-todolist_no="+list[i].todolist_no+">";
			str += "<td>"+list[i].todolist_no+"</td>";
			str += "<td><a href='#'>"+list[i].todolist_content+"</a></td>";
			str += "<td>"+list[i].tdlmanager_no+"</td>";
			str += "<td>"+list[i].todolist_status+"</td>";
			str += "<td>"+tdlService.displayTime(list[i].todolist_enddate)+"</td>";
			str += "</tr>";
		}
			
		tdlUL.html(str);
	});
	
	// to do list 추가 관련 modal
	//var modal = $(".modal");
	
	//사용자 정보 자동완성 관련
 		$("#search_user").autocomplete({
			minLength: 1,
			source: function(request, response){ 
				$.ajax({
					type: 'post',
					url: '/cos/project/proUserSearch',
					data: {user_nickname:$("#search_user").val()},
					dataType: 'json',
					success: function(data){
						$.each(data, function(index, item){
							console.log(item.user_nickname);
						});
						response(
							$.map(data, function(item){
								console.log("response map:"+item.user_nickname);
								return {
									label: item.user_nickname,
									value: item.user_nickname
								}
							}) 
						);		
					},
					error: function(){
						alert("json error");
					}
				});
 			},
	//modal 이 열릴 때 영역 한정
/* 	Which element the menu should be appended to. When the value is null, 
	the parents of the input field will be checked for a class of ui-front. 
	If an element with the ui-front class is found, the menu will be appended to that element. 
	Regardless of the value, if no element is found, the menu will be appended to the body. */
 			appendTo: '#proMemberInvite'
 		}); 
		
	
	
	
	
	
	
	
	
	
	
	
	
	</script>


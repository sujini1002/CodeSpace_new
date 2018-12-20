<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"/>
<div class="col-md-10" style="background-color:rgb(236,240,245); padding-top: 30px; padding-left: 50px;">
<!--  여기다가 작성 해주세요 -->

<jsp:include page="projectCommon.jsp" />

<br>

<div class="list-group h_list_group">
  <button type="button" class="list-group-item list-group-item-action active" style="background-color: #17a2b8; width: 100%;" disabled="disabled">
    	공지사항
    	<span style="float: right;"> 
    	<a href="${pageContext.request.contextPath }/project/notice/notice?project_no=${pro_info.project_no }" style="color: white;">더보기</a>
    	</span>
  </button>
</div>
<br>
<!-- 캘린더 표출 영역  -->
<table class='table'>
	<tr>
		<td>
			캘린더  <a href="#">더보기</a>
			<button onclick="goToday()">Today</button>
				<table class="h_table" style="text-align: center; border: 1px solid black; background-color: white;">
					<tr>
						<td colspan="7">
							<a href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year-1 }&month=${cal.month }&project_no=${pro_info.project_no }&user_no=${user_info.user_no}">&lt;&lt;</a>&nbsp;
							<a href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year }&month=${cal.month-1 }&project_no=${pro_info.project_no }&user_no=${user_info.user_no}">&lt;</a>
							&nbsp;${cal.year }년 ${cal.month+1 }월&nbsp; 
							<a href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year }&month=${cal.month+1 }&project_no=${pro_info.project_no }&user_no=${user_info.user_no}">&gt;</a>&nbsp;
							<a href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year+1 }&month=${cal.month }&project_no=${pro_info.project_no }&user_no=${user_info.user_no}">&gt;&gt;</a>
						</td>
						
					</tr>
					<tr class="week">
						<td class="sun">일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td class="sat">토</td>
					</tr>
					<tbody class="day_of_the_week"></tbody>
				</table>
		</td>
		<td>
			to do list
			<a href="${pageContext.request.contextPath}/project/tdlDashboard?project_no=${pro_info.project_no }&user_no=${user_info.user_no}">더보기</a>
			<!-- REST 방식의 to do list -->
			<table class="table" id="tdlboard" >	</table>
		</td>
		<%-- <td>공지사항 <a href="${pageContext.request.contextPath }/project/notice/notice?project_no=${pro_info.project_no }">더보기</a></td> --%>
	
	</tr>

	
</table>





<jsp:include page="../common/layout_footer.jsp" />


<!-- 수정하기 모달 -->
<div class="modal fade" id="projectInfo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">프로젝트 내용 수정하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/cos/project/projectUpdate" method="post" autocomplete=off>
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
				<input type="date" class="form-control" id="datepicker" name="prostring_enddate" value="${pro_info.prostring_enddate }">
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
        <h4 class="modal-title">프로젝트 끝내기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
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



<!-- 프로젝트 다시 시작하기 모달 -->
<div class="modal fade" id="projectRestart">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">프로젝트를 다시 시작하시겠습니까? 종료일자를 선택해주세요.</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/cos/project/projectRestart" method="post">
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
				<input type="date" class="form-control" name="prostring_enddate">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-danger">Project Restart</button>
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
        <h4 class="modal-title">사용자 초대하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
 		<form method="post" action="/cos/project/inviteMember"> 
	      <!-- 사용자 초대 -->
	      <div class="modal-body" id="memberInviteDiv">
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
	        <button type="submit" class="btn btn-primary" id="inviteMember">Invite member</button>
	      </div>
		 </form> 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- 프로젝트에 참여중인 사용자 보기 모달 -->
<div class="modal fade" id="proMemberInfo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">함께 하는 사용자들</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="modal-body" >
	      	<ul class="list-group">
	      		<li class="list-group-item d-flex justify-content-between align-items-center">
	      			<span style="color:blue;">${pm_info.user_nickname} (PM)
	      		</li>
	      	<c:forEach var="item" items="${member_info }">
	      		<li class="list-group-item d-flex justify-content-between align-items-center">
				    ${item.user_nickname }
				    <a class="badge badge-light memberDelete" onclick="memberDelete(this)" data-member_no="${item.user_no }">x</a>
				</li>
	      	</c:forEach>
	      	</ul>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- project revison history -->

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" 
	id="revisionHistory" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
  	
    <div class="modal-content">
		<div class="modal-header">
	        <h4 class="modal-title">프로젝트 정보 수정 이력</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	<span aria-hidden="true">&times;</span>
	        </button>
      	</div>
		<div class="modal-body" id="projectRevisionList" >
			
			
		
		</div>
    </div>
  </div>
</div>










<!-- todolist 처리를 위한 js -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script src="../js/jquery.autocomplete.multiselect.js"></script>


<script>
$(document).ready(function(){
	var day = '${cal.start}' * 1;	//day == 5
	var startDay = '${cal.startDay}' * 1;	//startDay == 1 
	var endDay = '${cal.endDay}' * 1;		//endDay == 30
	var newLine = 0;
	var str = '<tr>';
	var fulldate = ${cal.fulldate};
	var today = ${cal.today};
	
	if('${regged_date.startDay}' != ''){
		var regDate_start = ${regged_date.startDay};
		var regDate_end = ${regged_date.endDay};
	}else{
		var regDate_start = '';
		var regDate_end = '';
	}
	var color = ['red','orange','yellow','green','blue','purple'];
	//달력 앞쪽 공백 출력		   5
	for ( var i = 1 ; i < day ; i ++ ){
		str += '<td class="empty_room">&nbsp;</td>';
		newLine++;
	}
	//달력 1일 부터 날짜 계산
	for ( var i = startDay ; i <= endDay ; i++ ){
		if(today == fulldate[i-1]){
			str += '<td class="h_day ' + fulldate[i-1] + '"style="background-color: #17a2b8;opacity:0.7; overflow:hidden;" >' + i + '</td>';
			newLine++;
		}else{
			str += '<td class="h_day ' + fulldate[i-1] + '"style="overflow:hidden">' + i + '</td>';
			newLine++;
		} 
						
		if(newLine % 7 == 0){
			str+='</tr>';
			$('.day_of_the_week').html(str);
		}else{
			$('.day_of_the_week').html(str);
		}
	}
	//투두리스트 표시해주자
	for(var i = 0 ; i < regDate_start.length ; i++){
		for(var j = 0 ; j <= endDay-1; j++){
			var k = fulldate[j];
			$('.'+k).append('<hr class="h_'+i+fulldate[j]+'" style="margin:5px -20px 5px -20px; border: 1px solid white;opacity:0;">');
			if(regDate_start[i] <= fulldate[j] && fulldate[j]<=regDate_end[i]){
				$('.h_'+i+k).css({'border':'1px solid '+ color[ i % 6 ],'opacity':'0.8'});
			}
		}
	}
	

var url='${pageContext.request.contextPath}/project/notice';
$.ajax({
	url: url,
	dataType:"json",
	data:{
		"project_no":"${pro_info.project_no}"
	},
	success:function(response){
		if(response!=null){
			$.each(response,function(index,item){
				if(index<5){
					/* var data = '<li>'+item.notice_no+":"+item.notice_title+":"+item.notice_content+'</li>'; */
					var data = '<button type="button" class="list-group-item list-group-item-action" style="width: 100%;">'+item.notice_title+'</button>';
					/* $('.h_ul').append(data); */
					$('.h_list_group').append(data);
				}
			})
		}else{
		var data = '<button type="button" class="list-group-item list-group-item-action" style="width: 100%;">아직 공지사항이 없습니다. 첫번째 공지사항을 작성해주세요!</button>';
		$('.h_list_group').append(data);
		}
	}
});
});
//<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
function goToday(){
location.href='${pageContext.request.contextPath}/project/prjdash?project_no='+${pro_info.project_no }+'&user_no='+${loginInfo.user_no};
}

</script>

<!-- project 정보 관련 -->
<script>

$(function(){    
    $('#datepicker').datepicker({
    	container: '#inputDate',
    	dateFormat : 'yy-mm-dd',
    	minDate : 0
    });
});

var project_noValue = '<c:out value="${pro_info.project_no}" />';
	//'<c:out value="${pro_info.project_no}" />';
var tdlUL = $("#tdlboard");

// to do list 가져오는 function
projectService.getList({project_no:project_noValue}, function(list) {
	var color = ['red','orange','yellow','green','blue','purple'];
	var str = "<tr>";
		str += "<th>할 일</th>";
		str += "<th>담당자</th>";
		str += "<th>진행상태</th>";
		str += "<th>마감일</th>";
		str += "</tr>";
	
	
	if(list==null || list.length==0){
		tdlUL.html("");
		return;
	}
	
	for(var i=0, len=list.length ||0; i<len; i++){
		
		str += "<tr data-todolist_no="+list[i].todolist_no+">";
		str += "<td style='color:"+color[i % 6]+"'>"+list[i].todolist_content+"</a></td>";
		str += "<td>"+list[i].user_nickname+"</td>";
		str += "<td>"+list[i].todolist_status+"</td>";
		str += "<td>"+projectService.displayTime(list[i].todolist_enddate)+"</td>";
		str += "</tr>";
	}
		
	tdlUL.html(str);
});

// project 수정 이력 가져옴
$("#revisionView").click(function(){
	projectService.getRevisionHistory({project_no:project_noValue}, function(list) {
		var projectRevisionList = $("#projectRevisionList");
		if(list==null||list.length==0){
			projectRevisionList.html("수정 이력이 없습니다.");
			return;
		}
		
		
		var str ="";
		for(var i=0, len=list.length ||0; i<len; i++){
			str += "<p>revision date "+projectService.displayDetailTime(list[i].revision_date) + "<br> ";
			str += list[i].project_title+"/";
			str += list[i].project_content+"/";
			str += projectService.displayTime(list[i].project_startdate)+"/";
			str += projectService.displayTime(list[i].project_enddate)+ "</p>";
			
		}
		projectRevisionList.html(str);
		
	});
	
})


//사용자 정보 자동완성 관련
	$("#search_user").autocomplete({
	minLength: 2,
	source: function(request, response){ 
		//이미 선택된 사용자 정보가 있으면, 그 사용자의 user_no도 보낸다!!!!!!!!
		if(document.querySelectorAll(".selectedMember").length > 0){
			console.log(document.querySelectorAll(".selectedMember"));
			
			var selectedMember = document.querySelectorAll(".selectedMember");
			var member;
			
			for(var i=0, len=selectedMember.length; i<len; i++){
				member = selectedMember[i].value;
			}
			
			
			$.ajax({
				type: 'post',
				url: '/cos/project/userSearchExceptSelectedMember',
				data: {user_nickname:$("#search_user").val(),
						member:member
						//request.term : text box에 입력된 값	
				},
				dataType: 'json',
				success: function(data){
					response(
						$.map(data, function(item){
							return {
								label: item.user_nickname+"("+item.user_id+")",
								value: item.user_no
							}
						}) 
					);		
				},
				error: function(){
					console.log("user search json error");
				}
			});
		} else {
			$.ajax({
				type: 'post',
				url: '/cos/project/userSearch',
				data: {user_nickname:$("#search_user").val()
						//request.term : text box에 입력된 값	
				},
				dataType: 'json',
				success: function(data){
					response(
						$.map(data, function(item){
							return {
								label: item.user_nickname+"("+item.user_id+")",
								value: item.user_no
							}
						}) 
					);		
				},
				error: function(){
					console.log("user search json error");
				}
			});
		}
		},
		//자동완성 목록에서 특정 값 선택 시 처리하는 동작 구현
		/* select: function(event, ui){
			//var selectedMember = document.querySelectorAll(".selectedMember");
			var dataItem = this.dataItem(ui.item.value);
		console.log("선택된 사용자의 값을 출력할 수 있는가?: "+dataItem);
		}, 
		 */
	//modal 이 열릴 때 영역 한정
	/* 	Which element the menu should be appended to. When the value is null, 
	the parents of the input field will be checked for a class of ui-front. 
	If an element with the ui-front class is found, the menu will be appended to that element. 
	Regardless of the value, if no element is found, the menu will be appended to the body. */
		appendTo: '#proMemberInvite',
		multiselect: true
	}); 



 	//선택한 사용자의 user_no를 memberInviteDiv form에 input type="hidden"으로 만들기
    $("#inviteMember").click(function(){
        var selectedMember = document.querySelectorAll(".selectedMember");
    	var memberInviteDiv = document.getElementById("memberInviteDiv");
		
      	for(var i=0, len=selectedMember.length; i<len; i++){
	      	var input = document.createElement("input");
	      	input.setAttribute('type', 'hidden');
	      	input.setAttribute('name', 'member');
	      	input.setAttribute('value', selectedMember[i].value);
	      	//member[i].value = selectedMember[i].value;
	      	
	      	memberInviteDiv.appendChild(input);
        }
      	
      	//member에서 동일한 user_no가 있는 경우 alert
		//member 4명까지 추가 가능하도록.. 
      	
    }); 
 	
 	
 	// member 삭제
 	/* $('.memberDelete').onclick = function(){
 	    var r = confirm("삭제하시겠습니까?");
 	    var member_no = $(this).data('member_no');
 	    if (r == true) {
 	        location.href="${pageContext.request.contextPath}/project/projectMemberDelete?member_no="+member_no+"&user_no=${user_info.user_no}&project_no=${pro_info.project_no}" ;
 	    } else {
 	        
 	    }
 	} */
 	function memberDelete(data){
 	    
 	    var r = confirm("삭제하시겠습니까?");
	    var member_no = $(data).data('member_no');
	    if (r == true) {
	        location.href="${pageContext.request.contextPath}/project/projectMemberDelete?member_no="+member_no+"&user_no=${user_info.user_no}&project_no=${pro_info.project_no}" ;
	    } else {
	        
	    } 
 	}

</script>

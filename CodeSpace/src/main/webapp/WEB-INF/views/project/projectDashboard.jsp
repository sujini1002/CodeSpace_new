<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>


<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp"/>
<!-- 여기부터 화면 코드 작성해주세요 -->


<!-- 프로젝트 상세정보 표출 영역 -->
<div>
	<h3>${pro_info.project_title}  	
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectInfo">
			수정하기
		</button>
	</h3>
	<h4>${pro_info.project_content }</h4>
</div>

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


<!-- todolist modal -->
<!-- tdlmanager_no, todolist_content, todolist_status, todolist_enddate -->
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
	
	
</script>



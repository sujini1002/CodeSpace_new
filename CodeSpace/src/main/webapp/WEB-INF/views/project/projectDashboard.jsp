<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>


<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp"/>
<!-- 여기부터 화면 코드 작성해주세요 -->

<h5>*참고: 로그인 user 정보: ${user_info.user_no} / ${user_info.user_id } / ${user_info.user_name }</h5>


<!-- 프로젝트 상세정보 표출 영역 -->
<div>
	<h3>${pro_info.project_title}  	
	<a class="btn btn-default" 
		href="${pageContext.request.contextPath }/project/projectUpdate?project_no=${pro_info.project_no }&user_no=${user_info.user_no}">수정하기</a></h3>
	<h5>${pro_info.project_content }</h5>
	<h5>Project Manager No: ${pro_info.pm_no}</h5>
</div>
<!-- 캘린더와 공지사항 표출 영역  -->
<table class='table' style="width:100%;" >
	<tr>
		<td>캘린더  <a href="#">더보기</a></td>
		<td>공지사항 <a href="#">더보기</a></td>
	</tr>
	<tr>
		<td><img src="../images/stop.jpg" width=300px></td>
		<td>
			<table class='table'>
				<tr>
					<td>no</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>1</td>
					<td>하이</td>
					<td>2018-01-01</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<!-- REST 방식의 to do list -->
<h3>to do list: REST
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tdlModal">
		추가하기
	</button>
</h3>
<table class="table" id="tdlboard">	</table>

<jsp:include page="../common/layout_footer.jsp" />


<!-- todolist modal -->
<!-- tdlmanager_no, todolist_content, todolist_status, todolist_enddate -->
<div class="modal fade" id="tdlModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">To do list 작성하기</h4>
      </div>
      <!-- project_todolist 추가 항목 -->
      <div class="modal-body">
      	<!-- 담당자 번호 -->
		<div class="form-group">
			<label>담당자 번호</label>
			<input class="form-control" name='tdlmanager_no' >
		</div>
      	<!-- 담당 업무 -->
		<div class="form-group">
			<label>업무 내용</label>
			<input class="form-control" name='todolist_content' >
		</div>
      	<!-- 업무 진행 상태 -->
		<div class="form-group">
			<label>업무 진행 상태</label>
			<select>
			  <option value="todo">todo</option>
			  <option value="doing">doing</option>
			  <option value="done">done</option>
			</select>
		</div>
<!--       	업무 진행 상태
		<div class="dropdown">
		  <button class="btn btn-default dropdown-toggle" type="button" 
		  		  id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
		    status
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">to do</a></li>
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">doing</a></li>
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">done</a></li>
		  </ul>
		</div> -->
      	<!-- 종료 일정 -->
		<div class="form-group">
			<label>종료 날짜</label>
			<input type="date" class="form-control" name='todolist_enddate' >
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
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



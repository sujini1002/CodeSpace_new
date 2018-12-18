<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->
	
<%@ include file="projectCommon.jsp" %> 	 
<hr>
<!-- REST 방식의 to do list -->
	<h3>
		to do list
		<c:if test="${pro_info.project_status==true }">
		<button type="button" class="btn btn-primary btn-sm"
			data-toggle="modal" id="todolistForm" data-target="#tdlModal">추가하기</button>
		</c:if>
	</h3>
	
	<div class='container' id='todolistContainer'>
		
	</div>
	<jsp:include page="../common/layout_footer.jsp" />




	<!-- todolist modal -->
	<!-- tdlmanager_no, todolist_content, todolist_status, todolist_enddate -->
	<div class="modal fade" id="tdlModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">To do list</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- project_todolist 추가 항목 -->
				<div class="modal-body">
					<!-- project no -->
					<input type="hidden" name='project_no' id='project_no' value="${project_no }">
					<!-- 담당자 번호 -->
					<div class="form-group">
						<label>담당자</label> 
						<select class="form-control" name='tdlmanager_no' id='tdlmanager_no'>
							
						</select>
					</div>
					<!-- 담당 업무 -->
					<div class="form-group">
						<label>업무 내용</label> 
						<input class="form-control" name='todolist_content' id='todolist_content'>
					</div>
					<!-- 업무 진행 상태 -->
					<div class="form-group">
						<label>업무 진행 상태</label> 
						<select id='todolist_status'>
							<option value="todo">todo</option>
							<option value="doing">doing</option>
							<option value="done">done</option>
						</select>
					</div>
					<!-- 종료 일정 -->
					<div class="form-group">
						<label>종료 날짜</label> 
						<input type="date" class="form-control" name='tdlstring_enddate' id='tdlstring_enddate'>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="modalRegisterBtn">Save</button>
					<button type="button" class="btn btn-warning" id="modalModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="modalRemoveBtn">Remove</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	

<!-- todolist 처리를 위한 js -->
<script type="text/javascript" src="../js/todolist.js"></script>

<script>
	//to do list 페이지 접근 시 자동으로 목록 가져옴
	$(document).ready(function() {
		var project_noValue = ${project_no};

		//to do, doing, done으로 나눠서 보여주기
		var container = $("#todolistContainer");
		
		projectService.getList({
			project_no: project_noValue
		}, function(list){
			var str = "<div class='row'>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>TO DO</h2>";
				str += "		<ul class='todolistcontent' id='todo'></ul>";
				str += "	</div>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>DOING</h2>";
				str += "		<ul class='todolistcontent' id='doing'></ul>";
				str += "	</div>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>DONE</h2>";
				str += "		<ul class='todolistcontent' id='done'></div>";
				str += "	</div>";
				str += "</div>";
				
			if (list == null || list.length == 0) {
				container.html("to do list가 없습니다. 추가해주세요.");
				return;
			}
			container.html(str);

			var todo = $("#todo");
			var doing = $("#doing");
			var done = $("#done");
			
			for (var i = 0, len = list.length || 0; i < len; i++) {
				if(list[i].todolist_status=="todo"){
					var todoStr = "<li class='left clearfix' data-todolist_no='"+list[i].todolist_no+"'>";
						todoStr += "<div><div class='header'><strong class='primary-font'>"+list[i].todolist_content+"</strong><br>";
						todoStr += "<small class='pull-right text-muted'>"+projectService.displayTime(list[i].todolist_enddate)+"까지</small></div>";
						todoStr += "<p>담당자: "+list[i].user_nickname+"</p></div></li>";
					todo.append(todoStr);
						
				} else if(list[i].todolist_status=="doing"){
					var doingStr = "<li class='left clearfix' data-todolist_no='"+list[i].todolist_no+"'>";
						doingStr += "<div><div class='header'><strong class='primary-font'>"+list[i].todolist_content+"</strong><br>";
						doingStr += "<small class='pull-right text-muted'>"+projectService.displayTime(list[i].todolist_enddate)+"까지</small></div>";
						doingStr += "<p>담당자: "+list[i].user_nickname+"</p></div></li>";
					doing.append(doingStr);
					
				} else if(list[i].todolist_status=="done"){
					var doneStr = "<li class='left clearfix' data-todolist_no='"+list[i].todolist_no+"'>";
						doneStr += "<div><div class='header'><strong class='primary-font'>"+list[i].todolist_content+"</strong><br>";
						doneStr += "<small class='pull-right text-muted'>"+projectService.displayTime(list[i].todolist_enddate)+"까지</small></div>";
						doneStr += "<p>담당자: "+list[i].user_nickname+"</p></div></li>";
					done.append(doneStr);
				}
			}
		}); 
	}); //document.ready 끝

	
	
	
	// to do list 추가 관련
	$("#modalRegisterBtn").on("click", function(e) {
		var todolist = {
			project_no : $("#project_no").val(),
			tdlmanager_no : $("#tdlmanager_no").val(),				
			todolist_content : $("#todolist_content").val(),
			todolist_status : $("#todolist_status").val(),
			tdlstring_enddate : $("#tdlstring_enddate").val()
		};

		setTodolist.add(todolist, function(result) {
			alert(result);
			window.location.reload();
			$(".modal").find("input").val("");
			$(".modal").modal("hide");
		})
	})
	
	// to do list 정보 수정 관련 modalModBtn
	$("#modalModBtn").on("click", function(e) {
		var todolist = {
			todolist_no : $(".modal").data("todolist_no"),
			project_no : $("#project_no").val(),
			tdlmanager_no : $("#tdlmanager_no").val(),				
			todolist_content : $("#todolist_content").val(),
			todolist_status : $("#todolist_status").val(),
			tdlstring_enddate : $("#tdlstring_enddate").val()
		};
		console.log(todolist);

		setTodolist.modify(todolist, function(result) {
			
			alert(result);
			window.location.reload();
			$(".modal").find("input").val("");
			$(".modal").modal("hide");
		})
	})

	//to do list 데이터 ajax 전송 관련
	var setTodolist = (function() {
		//todolist 정보 추가
		function add(todolist, callback, error) {
			$.ajax({
				type : 'post',
				url : '/cos/project/todolistReg',
				data : JSON.stringify(todolist),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (callback) {
							callback(result);
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			})
		}
		
		//todolist 정보 수정
		function modify(todolist, callback, error){
			$.ajax ({
				type : 'post',
				url : '/cos/project/todolistModify',
				data : JSON.stringify(todolist),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (callback) {
							callback(result);
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			})
			
		}

		return {
			add : add,
			modify: modify
		};
	})();
	
	//to do list '추가하기' 버튼 클릭 시 project_no에 해당하는 member_no 가져와서 selectbox에 뿌리기
	$("#todolistForm").on("click", function(e){
		var project_noValue = ${project_no};
		var manager = $("#tdlmanager_no");
		//var str= "<option value="+${user_no}+">"+${user_no}+"</option>"
		
		projectService.getProjectMember({
			project_no:project_noValue
		}, function(list){
			var str = "";
			for(var i=0, len=list.length||0; i<len; i++){
				str += "<option value="+list[i].member_no+">"+list[i].user_nickname+"</option>"
			}
			manager.html(str);
		})
		
		$("#modalModBtn").hide();
		$("#modalRemoveBtn").hide();
	});
	
	
	//to do list title 클릭 시 todolist_no에 해당하는 todolist 정보 가져와서 보여주기
	$(".row").on("click", "li", function(e){
		var project_noValue = ${project_no};
		var project_status = ${pro_info.project_status};
		var todolist_no = $(this).data("todolist_no");
		
		projectService.getTodolistInfo({
			todolist_no: todolist_no}, 
			function(info){
			
			$(".modal").find("input[id='project_no']").val(info.project_no);
			$(".modal").find("input[id='todolist_content']").val(info.todolist_content);
			$(".modal").find("input[id='todolist_status']").val(info.todolist_status);
			
			$(".modal").data("todolist_no", info.todolist_no);
			
			$(".modal").find("buttin[id !='modalCloseBtn']").hide();
			$("#modalRegisterBtn").hide();
			$("#modalModBtn").show();
			$("#modalRemoveBtn").hide();
			
			if(project_status==true)
				$("#tdlModal").modal("show");
			else alert("프로젝트가 끝났습니다.");
			
		}) 
		
		var manager = $("#tdlmanager_no");
		projectService.getProjectMember({
			project_no:project_noValue
		}, function(list){
			var str = "";
			for(var i=0, len=list.length||0; i<len; i++){
				str += "<option value="+list[i].member_no+">"+list[i].user_nickname+"</option>"
			}
			manager.html(str);
		})
		str="";
		
	});
	
	
</script>
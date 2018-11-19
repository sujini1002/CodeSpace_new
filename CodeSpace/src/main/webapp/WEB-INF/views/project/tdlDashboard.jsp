<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10" style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->

	<!-- REST 방식의 to do list -->
	<h3>
		to do list
		<button type="button" class="btn btn-primary btn-sm"
			data-toggle="modal" data-target="#tdlModal">추가하기</button>
	</h3>
	<table class="table" id="tdlboard"></table>
	
	<div class='container' id='todolistContainer'></div>

	









	<jsp:include page="../common/layout_footer.jsp" />




	<!-- todolist modal -->
	<!-- tdlmanager_no, todolist_content, todolist_status, todolist_enddate -->
	<div class="modal fade" id="tdlModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">To do list 작성하기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- project_todolist 추가 항목 -->
				<div class="modal-body">
					<!-- project no -->
					<input type="hidden" id='project_no' value="${project_no }">
					<!-- 담당자 번호 -->
					<div class="form-group">
						<label>담당자 번호</label> <input class="form-control"
							id='tdlmanager_no'>
					</div>
					<!-- 담당 업무 -->
					<div class="form-group">
						<label>업무 내용</label> <input class="form-control"
							id='todolist_content'>
					</div>
					<!-- 업무 진행 상태 -->
					<div class="form-group">
						<label>업무 진행 상태</label> <select id='todolist_status'>
							<option value="todo">todo</option>
							<option value="doing">doing</option>
							<option value="done">done</option>
						</select>
					</div>
					<!-- 종료 일정 -->
					<div class="form-group">
						<label>종료 날짜</label> <input type="date" class="form-control"
							id='tdlstring_enddate'>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="modalRegisterBtn">Save
						changes</button>
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
	//to do list 페이지 접근 시 자동으로 댓글 목록 가져옴
	$(document).ready(function() {

		var project_noValue = ${project_no};
		var tdlUL = $("#tdlboard");

		// to do list 가져오는 function (테이븛형태)
		tdlService.getList({
			project_no : project_noValue
		},function(list) {
			var str = "<tr>";
				str += "<th>할 일</th>";
				str += "<th>담당자</th>";
				str += "<th>진행상태</th>";
				str += "<th>마감일</th>";
				str += "</tr>";

			if (list == null || list.length == 0) {
				tdlUL.html("");
				return;
			}

			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += "<tr data-todolist_no="+list[i].todolist_no+">";
				str += "<td><a href='#'>"+ list[i].todolist_content	+ "</a></td>";
				str += "<td>"+ list[i].user_name+ "</td>";
				str += "<td>"+ list[i].todolist_status+ "</td>";
				str += "<td>"+ tdlService.displayTime(list[i].todolist_enddate)+ "</td>";
				str += "</tr>";
			}

			tdlUL.html(str);
		});
		
		//to do, doing, done으로 나눠서 보여주기
		var container = $("#todolistContainer");
		
		tdlService.getList({
			project_no: project_noValue
		}, function(list){
			var str = "<div class='row'>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>TO DO</h2>";
				str += "		<div id='todo'></div>";
				str += "	</div>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>DOING</h2>";
				str += "		<div id='doing'></div>";
				str += "	</div>";
				str += "	<div class='col-md-4'>";
				str += "		<h2>DONE</h2>";
				str += "		<div id='done'></div>";
				str += "	</div>";
				str += "</div>";
				
				
			if (list == null || list.length == 0) {
				container.html("");
				return;
			}
			container.html(str);
			var todo = $("#todo");
			var doing = $("#doing");
			var done = $("#done");
			
			for (var i = 0, len = list.length || 0; i < len; i++) {
				if(list[i].todolist_status=="todo"){
					var todoStr = "<p data-todolist_no="+list[i].todolist_no+">";
						todoStr += list[i].todolist_content	+"<br>" 
						todoStr += "</p>";
					todo.append(todoStr);
				} else if(list[i].todolist_status=="doing"){
					var doingStr = "<p data-todolist_no="+list[i].todolist_no+">";
						doingStr += list[i].todolist_content	+"<br>" 
						doingStr += "</p>";
					doing.append(doingStr);
				} else if(list[i].todolist_status=="done"){
					var doneStr = "<p data-todolist_no="+list[i].todolist_no+">";
						doneStr += list[i].todolist_content	+"<br>" 
						doneStr += "</p>";
					done.append(doneStr);
				}
			}
			
			
				
		}); 
		
		


	});

	// to do list 추가 관련
	$("#modalRegisterBtn").on("click", function(e) {
		var todolist = {
			project_no : $("#project_no").val(),
			tdlmanager_no : $("#tdlmanager_no").val(),				
			todolist_content : $("#todolist_content").val(),
			todolist_status : $("#todolist_status").val(),
			tdlstring_enddate : $("#tdlstring_enddate").val()
		};

		todolistInsert.add(todolist, function(result) {
			alert(result);

			$(".modal").find("input").val("");
			$(".modal").modal("hide");
		})
	})

	//to do list 데이터 ajax 전송 관련
	var todolistInsert = (function() {
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

		return {
			add : add
		};
	})();
	
	
	
	
	
</script>
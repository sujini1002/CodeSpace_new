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

<!-- to do list 표출영역 -->
<h3>to do list</h3>
<!-- var의 역할= for 문에서의 i  -->
<c:forEach var="tdl" items="${tdl_list }" varStatus="status">
	${status.count}. ${tdl.todolist_content} | ${tdl.todolist_status }<br>
</c:forEach>
<!-- REST 방식의 to do list -->
<hr>
<h3>to do list: REST</h3>
<%-- <a href="${pageContext.request.contextPath }/project/tdl">REST방식의 tdl</a> --%>
<div>
	<ul class="tdlboard">
		<li class="left" data-project_no='86'>
			<div>
				<div class="header">
					<strong>user00</strong>
					<small class="pull-right text-muted">2018-01-01</small>
				</div>
				<p> great ! </p>
			</div>			
		</li>
	</ul>
</div>



<jsp:include page="../common/layout_footer.jsp" />
<!-- todolist 처리를 위한 js -->
<script type="text/javascript" src="../js/todolist.js" ></script>

<!-- <script type="text/javascript">
	$(document).ready(function(){
		console.log(tdlService);
	})
</script> -->

<script>
	console.log("---JS TEST---");
	
	var project_noValue = '<c:out value="${pro_info.project_no}" />';
	var tdlUL = $(".tdlboard");
	
	
	tdlService.getList({project_no:project_noValue}, function(list) {
		var str="";
		
		if(list==null || list.length==0){
			tdlUL.html("");
			return;
		}
		
		for(var i=0, len=list.length ||0; i<len; i++){
			console.log(list[i]);
			
			str += "<li class='left' data-project_no='"+list[i].todolist_no+"'>";
			str += "	<div><div class='header'><strong>"+list[i].tdlmanager_no+"</strong>";
			str += "		<small class='pull-right text-muted'>"+list[i].todolist_enddate+"</small></div>";
			str += "		<p>"+list[i].todolist_content+"</p></div></li>";	
		}
			
		tdlUL.html(str);
			
	});
</script>



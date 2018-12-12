<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 프로젝트 상세정보 표출 영역 -->
<div>
	<!-- 프로젝트 제목 -->
	<h4>${pro_info.project_title}  	
	<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#proMemberInfo">
		<i class="fas fa-user-friends"></i>
	</button>
	<c:if test="${pro_info.project_status==false }">

		<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#projectRestart">
			프로젝트 다시 시작하기
		</button>
	</c:if>
	<c:if test="${pro_info.project_status==true }">
	
		<c:if test="${pro_info.pm_no == user_info.user_no }">
			<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#projectInfo">
				<!-- 프로젝트 정보 수정 -->
				<i class="fas fa-edit"></i>
			</button>
			<!-- 프로젝트는 삭제 x, 프로젝트 끝내기 버튼을 누르면 방향으로 함 -->
			<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#projectFinish">
				프로젝트 끝내기
			</button>
			<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#proMemberInvite">
				<!-- 사용자 추가 -->
				<i class="fas fa-user-plus"></i>		
			</button>
		</c:if>
	</c:if>
		<a href="revisionList/${pro_info.project_no }" style="font-size: x-samll;" id="revisionView"
			data-toggle="modal" data-target=".bd-example-modal-lg">프로젝트 수정 이력 보기</a>
	</h4>
	<!-- 프로젝트 상세 내용  -->
	<h5>${pro_info.project_content } (${pro_info.prostring_startdate } ~ ${pro_info.prostring_enddate })</h5>
</div>


<script type="text/javascript" src="../js/todolist.js" ></script>
<!-- project info 관련 -->



	



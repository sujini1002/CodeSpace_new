<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />
<!--  여기다가 작성 해주세요 -->

<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a
		href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
	<li role="presentation"><a
		href="${pageContext.request.contextPath}/mypage/activity">내 활동</a></li>
</ul>
<div class="y_profile_wrapper">
	<form method="post" enctype="multipart/form-data">
		<div class="y_edit_myPhoto">
			<input type="file" name="photo" class="y_btn_file" />
		</div>

		<div class="y_editForm">

			<table class="table">
				<tr>
					<td colspan="2"><input type="hidden" name="user_no"
						value="${loginInfo.user_no}"></td>
				</tr>
				<tr>
					<td class="item">아이디</td>
					<td class="contents"><input type="text" name="user_id"
						value="${loginInfo.user_id}" readonly /></td>
				</tr>
				<tr>
					<td class="item">이름</td>
					<td class="contents"><input type="text" name="user_name"
						value="${loginInfo.user_name}" readonly /></td>
				</tr>
				<tr>
					<td class="item">닉네임</td>
					<td class="contents"><input type="text" name="user_nickname"
						value="${loginInfo.user_nickname}" /></td>
				</tr>
				<tr>
					<td class="item">내 HP</td>
					<td class="contents"><input type="text" name="user_url"
						value="${loginInfo.user_url}" /></td>
				</tr>
				<tr>
					<td class="item">내 소개</td>
					<td class="contents"><input type="text" name="user_intro"
						value="${loginInfo.user_intro}" /></td>
				</tr>
				<tr>
					<td class="item">내가 관심있는 태그</td>
					<td class="contents"><input type="text" name="user_tag"
						value="${loginInfo.user_tag}" /></td>
				</tr>
			</table>

		</div>
		<input class="btn btn-success yu_btn2" type="submit" value="수정완료">
	</form>
</div>

<!-- Modal 처리 -->
<div class="modal fade" id="myModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="madal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">$times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<Button type="button" class="btn btn-defalut" data-dismiss="modal">Close</Button>
				<Button type="button" class="btn btn-primary">Save Changes</Button>
			</div>
		</div>
	</div>
</div>
<!-- modal 끝 -->

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		function checkModal(result) {
			if (result == '') {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("프로필 정보가 수정되었습니다.");
			}
			$("#myModal").modal("show");
		}
	});
</script>






<jsp:include page="../common/layout_footer.jsp" />

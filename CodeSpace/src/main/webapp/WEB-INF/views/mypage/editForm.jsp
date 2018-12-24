<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<!-- right Contents 시작 -->
<div class="col-md-10"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->

	<ul class="nav nav-pills">
		<li class="nav-item">
			<a class="nav-link active" href="${pageContext.request.contextPath}/mypage/mypage">프로필</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false" style="color:gray;">내 활동</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myqst?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 질문</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myans?page=1&perPageNum=10&user_no=${loginInfo.user_no}">내가 한 답변</a> 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myBookmark?page=1&perPageNum=10&user_no=${loginInfo.user_no}">즐겨찾기</a>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/mypage/myPrj?user_no=${loginInfo.user_no}" style="color:gray;">프로젝트</a></li>
	</ul>
	
	
	<div class="y_profile_wrapper">
		<form class="row" method="post" enctype="multipart/form-data" id="form" runat="server">
			<%-- <div class="y_edit_myPhoto">
				<input type="file" name="photo" class="y_btn_file"
					src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfo.user_photo}">
			</div> --%>
			<div class="y_edit_myPhoto col-md-3">
				<img id="y_image_profile" src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${userInfoVo.user_photo==null}">noimage.png</c:when><c:otherwise>${userInfoVo.user_photo}</c:otherwise></c:choose>">
<%-- 				<img id="y_image_profile" src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/${loginInfo.user_photo}"> --%>
				<input type="file" name="photo" class="y_btn_file" id="imgInput">
			</div>
			
			<script type="text/javascript">
			var cnt = 0;
			// 사진 수정할 때 파일 선택후 이미지 띄우기
			$(function(){
				$("#imgInput").on('change', function(){
					readURL(this);
				});
			});
			
			function readURL(input){
				if(input.files && input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$('#y_image_profile').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
					cnt = 1;
				}
			}
			</script>

			<div class="y_editForm col-md-7 row">

				<table class="table">
					<tr>
						<td colspan="2"><input type="hidden" name="user_no"
							value="${userInfoVo.user_no}"></td>
					</tr>
					<tr>
						<td class="item">아이디</td>
						<td class="contents"><input type="text" name="user_id"
							value="${userInfoVo.user_id}" readonly /></td>
					</tr>
					<c:if test="${userInfoVo.user_pw ne 'null'}">
					<tr>
						<td class="item">비밀번호</td>
						<td class="contents"><input type="password" name="user_pw"
							value="${userInfoVo.user_pw}"/></td>
					</tr>
					</c:if>
					<c:if test="${userInfoVo.user_pw eq 'null'}">
					<tr hidden="hidden">
						<td class="item" hidden="hidden">비밀번호</td>
						<td class="contents"><input type="password" name="user_pw"
							value="${userInfoVo.user_pw}" hidden="hidden"/></td>
					</tr>
					</c:if>
					<tr>
						<td class="item">이름</td>
						<td class="contents"><input type="text" name="user_name"
							value="${userInfoVo.user_name}" readonly /></td>
					</tr>
					<tr>
						<td class="item">닉네임</td>
						<td class="contents"><input type="text" name="user_nickname"
							value="${userInfoVo.user_nickname}" /></td>
					</tr>
					<tr>
						<td class="item">내 Url</td>
						<td class="contents"><input type="text" name="user_url"
							value="${userInfoVo.user_url}" /></td>
					</tr>
					<tr>
						<td class="item">내 소개</td>
						<td class="contents"><input type="text" name="user_intro"
							value="${userInfoVo.user_intro}" /></td>
					</tr>
					<tr>
						<td class="item">내가 관심있는 태그</td>
						<td class="contents"><input type="text" name="user_tag"
							value="${userInfoVo.user_tag}" /></td>
					</tr>
				</table>

			</div>
<!-- 			<input class="btn btn-success yu_btn2" onclick="subMit()" type="submit" value="수정완료"> -->
		</form>
			<input class="btn btn-success yu_btn2" onclick="subMit()" value="수정완료">
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
			console.log('${userInfoVo}');
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
		
		function subMit(){
			var form = $('#form')[0];
			var formData = new FormData(form);
			var url = '${pageContext.request.contextPath}/mypage/editForm';
			
			if(cnt==1){
			$.ajax({
				url:'http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/savePic',
				/* url:'http://localhost:8080/cospic/savePic', */
				dataType:'JSON',
				type:'POST',
				data:formData,
			    processData : false,
	            contentType : false,
	            success:function(result){
	            	$.ajax({
           				url:url,
	            		type:'POST',
           				data : {
           					"user_id":result.user_id,
           					"user_pw":result.user_pw,
           					"user_name":result.user_name,
           					"user_photo":result.user_photo,
           					"user_url":result.user_url,
           					"user_intro":result.user_intro,
           					"user_tag":result.user_tag,
           					"user_nickname":result.user_nickname
           				},
           				success:function(result){
           					if(result == 0){
           						/* location.href='${pageContext.request.contextPath}/userinfo/reconfirm'; */
           						alert('수정오류!!');
           					}else{
           						location.href='${pageContext.request.contextPath}/mypage/mypage';
           					}
           				}
           			});
	            	
	            }
			});
			}else{
				var photo = '${userInfoVo.user_photo}';
				formData.append('user_photo',photo);
				$.ajax({
       				url:url,
            		type:'POST',
    			    processData : false,
    	            contentType : false,
       				data : formData,
       				success:function(result){
       					if(result == 0){
       						/* location.href='${pageContext.request.contextPath}/userinfo/reconfirm'; */
       						alert('수정오류!!');
       					}else{
       						location.href='${pageContext.request.contextPath}/mypage/mypage';
       					}
       				}
       			});
			}
		}
	</script>






	<jsp:include page="../common/layout_footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
			<img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfo.user_photo}" />
		</td>
		<td>${userInfo.user_id}</td>
	</tr>
	<tr>
		<td>${userInfo.user_nickname}</td>
	</tr>
	<tr>
		<td>${userInfo.user_intro}</td>
	</tr>
</table>

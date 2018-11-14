<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table style="float:right; margin-right:20px">
	<tr>
		<td rowspan="3">
			<img src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfo.user_photo}" width="70px" height="70px"/>
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
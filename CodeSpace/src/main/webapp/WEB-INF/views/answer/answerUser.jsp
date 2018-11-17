<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
			<img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${user.user_photo}" />
		</td>
		<td>${user.user_id}</td>
	</tr>
	<tr>
		<td>${user.user_nickname}</td>
	</tr>
	<tr>
		<td>${user.user_intro}</td>
	</tr>
</table>
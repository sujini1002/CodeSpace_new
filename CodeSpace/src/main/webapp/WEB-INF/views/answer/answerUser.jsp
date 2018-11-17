<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
			<img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfoList[num.index].user_photo}" />
		</td>
		<td>${userInfoList[num.index].user_id}</td>
	</tr>
	<tr>
		<td>${userInfoList[num.index].user_nickname}</td>
	</tr>
	<tr>
		<td>${userInfoList[num.index].user_intro}</td>
	</tr>
</table>
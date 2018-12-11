<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
			<a onclick="moveUserpage(this)" id="k_userPage_${userInfo.user_no}">
			<img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfo.user_photo}" />
			</a>
		</td>
	</tr>
	<tr>
		<td><span class="k_userpage"
			onclick="moveUserpage(this)" id="k_userPage_${userInfo.user_no}">
				${userInfo.user_nickname} </span></td>
	</tr>
</table>

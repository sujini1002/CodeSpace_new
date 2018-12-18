<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
			<a onclick="moveUserpage(this)" class="k_cursor" id="k_userPage_${userInfo.user_no}">
			<img class="k_userImg" src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${userInfo.user_photo==null}">noimage.png</c:when><c:otherwise>${userInfo.user_photo}</c:otherwise></c:choose>" />
			</a>
		</td>
	</tr>
	<tr>
		<td><span class="k_userpage k_cursor"
			onclick="moveUserpage(this)" id="k_userPage_${userInfo.user_no}">
				${userInfo.user_nickname} </span></td>
	</tr>
</table>

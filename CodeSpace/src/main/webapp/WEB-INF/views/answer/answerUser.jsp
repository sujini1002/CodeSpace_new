<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
		<a onclick="moveUserpage(this)" id="k_userPage_${userInfoList[num.index].user_no}">
			<img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfoList[num.index].user_photo}" />
		</a>
		</td>
	</tr>
	<tr>
		<td><span  onclick="moveUserpage(this)"  class="k_userpage" id="k_userPage_${userInfoList[num.index].user_no}">
				${userInfoList[num.index].user_nickname} </span></td>
	</tr>
</table>